#!/usr/local/bin/ruby

require File.expand_path(File.join(File.dirname(__FILE__), "../lib/goo_maps.rb"))
require 'fileutils'
require 'mini_magick'
require 'progressbar'

if ARGV.size < 2
  puts "Usage: ./grab-goo-maps.rb <zoom_level> <target_dir>"
  puts "  zoom_level - 3..18, bigger zoom will produce bigger image"
  puts "  target_dir - place, where all tiles and !map.jpg will be stored"
  puts
  puts "This program supports proxy via $http_proxy environment var"
  puts "For example: $http_prxy = 'http://username:password@proxy.host.com:3128'"
  puts
  puts "Warning! Glue operation is extremely slow, big zoom levels take A LOT of time"
  exit
end

Z = ARGV[0].to_i
dir = ARGV[1]
N = 2**Z

puts "Using zoom level = #{Z}, total tiles count (both surfaces) = #{N**2*2}"
unless Dir.exists? dir
  FileUtils.mkdir dir
  puts "Directory #{dir} was created"
end

params = [{:x => 0, :y => 0}, {:x => N-1, :y => N-1}, Z, [:sattelite, :labels]]

puts "Downloading..."

d = GooMaps.create_downloader(dir)
d.fetcher.use_proxy ENV['http_proxy'] if ENV['http_proxy']
d.download_range(*params)

progress = ProgressBar.new("Hardcore glue", N**2*2)
img_file_name = File.join(dir, "!map.jpg")

FileUtils.cp File.join(File.dirname(__FILE__), "empty.jpg"), img_file_name
img = MiniMagick::Image.new(img_file_name)
img.resize "#{256 * N}x#{256 * N}"

GooMaps::TileInfo.range(*params) do |t|
  f = File.join(dir, d.storage.format_file_name(t))
  f.gsub("/", "\\") if img.windows?
  x, y = t.x, t.y
  img.draw "image Over #{x*256},#{y*256} 0,0 '#{f}'"
  progress.inc
end

puts
puts "Done! Check for #{img_file_name}"

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'goo_maps')

require 'tile_info'
require 'tiles_range'
require 'url_builder'
require 'fetcher'
require 'tiles_downloader'
require 'tiles_storage'

module GooMaps
  def self.create_downloader(dir)
    TilesDownloader.new(UrlBuilder.new, Fetcher.new, TilesStorage.new(dir))
  end
end
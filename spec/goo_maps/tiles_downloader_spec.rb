require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))

describe TilesDownloader do
  let (:url_builder) { double :get_url => "http://maps.google.com/" }
  let (:fetcher)     { double :fetch => "SOME DATA" }
  let (:downloader)  { TilesDownloader.new url_builder, fetcher }

  it "downloads a tile by given x, y, z and type into specified folder"
end
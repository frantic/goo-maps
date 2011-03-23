require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))

describe TilesDownloader do
  let (:url_builder) { double :get_url => "http://maps.google.com/" }
  let (:fetcher)     { double :fetch => "SOME DATA" }
  let (:storage)     { double :exists? => false }
  let (:downloader)  { TilesDownloader.new url_builder, fetcher, storage }

  it "downloads a tile" do
    url_builder.should_receive :get_url
    fetcher.should_receive :fetch
    storage.should_receive :put
    downloader.download TileInfo.new(1, 1, 1, :sattelite)
  end
  
  it "doesn't download tile if it is already downloaded" do
    storage.stub(:exists?).and_return(true)
    fetcher.should_not_receive :fetch
    downloader.download TileInfo.new(1, 1, 1, :sattelite)
  end
  
  it "downloads range of tiles" do
    storage.should_receive(:put).exactly(25).times
    tiles_range = TilesRange.new 1, 1, 5, 5, 7, [:sattelite]
    downloader.download_range tiles_range
  end
end
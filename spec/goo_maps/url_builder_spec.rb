require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))

describe UrlBuilder do
  let (:builder       ) { UrlBuilder.new }
  let (:sattelite_tile) { TileInfo.new 10, 12, 7, :sattelite }
  let (:labels_tile   ) { TileInfo.new 10, 12, 7, :labels }
  let (:unknown_tile  ) { TileInfo.new 10, 12, 7, :wtf }
  
  it "builds Google Maps chunk URL" do
    builder.get_url(sattelite_tile).should_not be_empty
  end
  
  it "builds url for sattelite map chunks" do
    builder.get_url(sattelite_tile).should match(/^http:\/\/khm[\d].google/)
  end
  
  it "builds url for labels map chunks" do
    builder.get_url(labels_tile).should match(/http:\/\/mt[\d].google.com/)
  end
  
  it "raises exception for unknown map type" do
    expect { builder.get_url(unknown_tile) }.to raise_error
  end
end

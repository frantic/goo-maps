require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))

describe UrlBuilder do
  let (:builder) { UrlBuilder.new }
  
  it "builds Google Maps chunk URL" do
    x, y, z, surface = 10, 12, 7, :sattelite
    builder.get_url(x, y, z, surface).should_not be_empty
  end
  
  it "builds url for sattelite map chunks" do
    builder.get_url(1, 1, 1, :sattelite).should match(/^http:\/\/khm[\d].google/)
  end
  
  it "builds url for labels map chunks" do
    builder.get_url(1, 1, 1, :labels).should match(/http:\/\/mt[\d].google.com/)
  end
  
  it "raises exception for unknown map type" do
    expect { builder.get_url(1, 1, 1, :wtf) }.to raise_error
  end
end

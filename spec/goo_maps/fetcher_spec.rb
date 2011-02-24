require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))

describe Fetcher do
  let (:fetcher) { Fetcher.new }
  
  it "fetches given url" do
    # Using proxy for people without direct Internet connection (like me)
    fetcher.use_proxy ENV['http_proxy']
    fetcher.fetch("http://google.com/").should_not be_empty
  end
  
  it "doesn't use proxy by default" do
    fetcher.should_not be_using_proxy
  end
  
  it "can use custom http proxy server" do
    fetcher.use_proxy "http://user:pass@host:3128"
    fetcher.should be_using_proxy
  end
end
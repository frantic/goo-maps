require 'net/http'

module GooMaps
  class Fetcher
    def initialize
      @proxy = Hash.new { |hash, key| hash[key] = nil }
    end
    
    def use_proxy(proxy_url)
      uri = URI.parse(proxy_url)
      @proxy['host'] = uri.host
      @proxy['port'] = uri.port
      if uri.userinfo
        @proxy['user'], @proxy['pass'] = *uri.userinfo.split(/:/)
      end
    end
    
    def using_proxy?
      !!@proxy['host']
    end
    
    def fetch(url)
      uri = URI.parse(url)
      proxy_params = [@proxy['host'], @proxy['port'], @proxy['user'], @proxy['pass']]
      Net::HTTP::Proxy(*proxy_params).start(uri.host, uri.port) {|http|
        http.get(uri.path).body
      }
    end
  end
end
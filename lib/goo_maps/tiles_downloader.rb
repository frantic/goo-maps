module GooMaps
  class TilesDownloader
    def initialize(url_builder, fetcher)
      @url_builder, @fetcher = url_builder, fetcher
    end
  end
end
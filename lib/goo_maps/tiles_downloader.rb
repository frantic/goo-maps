module GooMaps
  class TilesDownloader
    attr_reader :url_builder, :fetcher, :storage
    def initialize(url_builder, fetcher, storage)
      @url_builder, @fetcher, @storage = url_builder, fetcher, storage
    end
    
    def download(tile_info)
      return if @storage.exists?(tile_info)
      
      url = @url_builder.get_url(tile_info)
      data = @fetcher.fetch(url)
      @storage.put tile_info, data
    end
    
    def download_range(left_top, right_bottom, z, surfaces)
      TileInfo.range(left_top, right_bottom, z, surfaces) { |t| download t }
    end
  end
end
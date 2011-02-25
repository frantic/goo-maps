module GooMaps
  class TilesStorage
    
    def initialize(folder)
      @folder = folder
    end
    
    def put(tile_info, data)
      file_name = File.join(@folder, format_file_name(tile_info))
      File.open(file_name, "wb") { |f| f << data }
    end
    
    def get(tile_info)
      file_name = File.join(@folder, format_file_name(tile_info))
      File.open(file_name, "rb") { |f| return f.read }
    end
    
    def exists?(tile_info)
      File.exists? File.join(@folder, format_file_name(tile_info))
    end
  
    def format_file_name(tile_info)
      x, y, z, s = tile_info.x, tile_info.y, tile_info.z, tile_info.surface[0].upcase
      "#{s}-#{z}-#{x}-#{y}.png"
    end
  end
end

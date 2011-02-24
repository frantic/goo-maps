module GooMaps
  class TilesStorage
    
    def initialize(folder)
      @folder = folder
    end
    
    def put(x, y, z, tile_type, data)
      file_name = File.join(@folder, format_file_name(x, y, z, tile_type))
      File.open(file_name, "wb") { |f| f << data }
    end
    
    def get(x, y, z, tile_type)
      file_name = File.join(@folder, format_file_name(x, y, z, tile_type))
      File.open(file_name, "rb") { |f| return f.read }
    end
    
    def exists?(x, y, z, tile_type)
      File.exists? File.join(@folder, format_file_name(x, y, z, tile_type))
    end
    
  private
  
    def format_file_name(x, y, z, tile_type)
      "tile_#{tile_type[0]}_#{x}_#{y}_#{z}"
    end
  end
end

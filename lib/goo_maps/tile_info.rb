module GooMaps
  class TileInfo
    attr_accessor :x, :y, :z, :surface
    
    def initialize(x, y, z, surface)
      @x, @y, @z, @surface = x, y, z, surface
    end
  end
end

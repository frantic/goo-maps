module GooMaps
  class TileInfo
    attr_accessor :x, :y, :z, :surface
    
    def initialize(x, y, z, surface)
      @x, @y, @z, @surface = x, y, z, surface
    end
    
    def self.range(left_top, right_bottom, z, surfaces, &block)
      surfaces.each do |surface|
        left_top[:x].upto(right_bottom[:x]) do |x|
          left_top[:y].upto(right_bottom[:y]) do |y|
            yield TileInfo.new(x, y, z, surface)
          end
        end
      end
    end
  end
end

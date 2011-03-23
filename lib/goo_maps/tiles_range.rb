module GooMaps
  class TilesRange
    attr_accessor :left_x, :top_y, :right_x, :bottom_y, :z, :surfaces
    
    def initialize(left_x, top_y, right_x, bottom_y, z, surfaces)
      @left_x, @top_y, @right_x, @bottom_y = left_x, top_y, right_x, bottom_y
      @z, @surfaces = z, surfaces
    end
    
    def each(&block)
      @surfaces.each do |surface|
        @left_x.upto(@right_x) do |x|
          @top_y.upto(@bottom_y) do |y|
            yield TileInfo.new(x, y, z, surface)
          end
        end
      end
    end
  end
end
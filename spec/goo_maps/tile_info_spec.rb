require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))

describe TileInfo do
  it "has 'x', 'y' and 'z' coordinates and 'surface' (sattelite, labels, etc.)" do
    tile = TileInfo.new 1, 2, 3, :sattelite
    tile.should respond_to(:x)
    tile.should respond_to(:y)
    tile.should respond_to(:z)
    tile.should respond_to(:surface)
  end
  
  describe ".range" do
    it "calls block for each TileInfo in range" do
      call_back = double
      call_back.should_receive(:iterate).with(an_instance_of(TileInfo)).exactly(32).times
      TileInfo.range({:x => 1, :y => 1}, {:x => 4, :y => 4}, 0, [:labels, :sattelite]) do |t|
        call_back.iterate t
      end
    end
  end
end

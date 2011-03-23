require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))

describe TileInfo do
  it "has 'x', 'y' and 'z' coordinates and 'surface' (sattelite, labels, etc.)" do
    tile = TileInfo.new 1, 2, 3, :sattelite
    tile.should respond_to(:x)
    tile.should respond_to(:y)
    tile.should respond_to(:z)
    tile.should respond_to(:surface)
  end
end

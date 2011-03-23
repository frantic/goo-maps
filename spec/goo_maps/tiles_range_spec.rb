require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))

describe TilesRange do
  it "calls block for each TileInfo in range" do
    call_back = double
    call_back.should_receive(:iterate).with(an_instance_of(TileInfo)).exactly(32).times # 4 * 4 * 2 = 32
    range = TilesRange.new 1, 1, 4, 4, 0, [:labels, :sattelite]
    range.each { |t| call_back.iterate t }
  end
end
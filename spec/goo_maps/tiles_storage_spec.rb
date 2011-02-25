require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))

describe TilesStorage do
  
  before(:all) do
    Dir.mkdir(temp_folder) unless Dir.exists?(temp_folder)
  end
  
  after(:all) do
    FileUtils.rm_rf temp_folder
  end
  
  let (:storage) { TilesStorage.new temp_folder }
  let (:sattelite_tile) { TileInfo.new 10, 12, 7, :sattelite }
  let (:labels_tile) { TileInfo.new 10, 12, 7, :labels }
  
  it "names file by x, y, z coordinates and tile type" do
    x, y, z = 1, 2, 3
    storage.format_file_name(sattelite_tile).should == "S-7-10-12.png"
    storage.format_file_name(labels_tile).should == "L-7-10-12.png"
  end
  
  it "puts tile's content to file" do
    file_name = File.join temp_folder, storage.format_file_name(sattelite_tile)
    storage.put sattelite_tile, "some content"
    File.exists?(file_name).should be_true
  end
  
  it "gets tile's content if it exists" do
    storage.put sattelite_tile, "testing"
    storage.get(sattelite_tile).should == "testing"
  end
  
  describe "#exists?" do
    it "returns false if there is no such tile" do
      storage.exists?(labels_tile).should be_false
    end
    
    it "returns true if that tile is stored" do
      storage.put sattelite_tile, "some content"
      storage.exists?(sattelite_tile).should be_true
    end
  end
end

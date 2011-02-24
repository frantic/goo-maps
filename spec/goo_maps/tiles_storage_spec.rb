require File.expand_path(File.join(File.dirname(__FILE__), "../spec_helper"))

describe TilesStorage do
  
  before(:all) do
    Dir.mkdir(temp_folder) unless Dir.exists?(temp_folder)
  end
  
  after(:all) do
    FileUtils.rm_rf temp_folder
  end
  
  let (:storage) { TilesStorage.new temp_folder }
  
  it "names file by x, y, z coordinates and tile type" do
    x, y, z = 1, 2, 3
    storage.send(:format_file_name, x, y, z, :sattelite).should == "tile_s_1_2_3"
    storage.send(:format_file_name, x, y, z, :label).should == "tile_l_1_2_3"
  end
  
  it "puts tile's content to file" do
    x, y, z, t = 1, 2, 3, :sattelite
    file_name = File.join temp_folder, storage.send(:format_file_name, x, y, z, t)
    storage.put x, y, z, t, "some content"
    File.exists?(file_name).should be_true
  end
  
  it "gets tile's content if it exists" do
    x, y, z, t = 11, 12, 3, :sattelite
    storage.put x, y, z, t, "testing"
    storage.get(x, y, z, t).should == "testing"
  end
  
  describe "#exists?" do
    it "returns false if there is no such tile" do
      x, y, z, t = 101, 102, 3, :sattelite
      storage.exists?(x, y, z, t).should be_false
    end
    
    it "returns true if that tile is stored" do
      x, y, z, t = 111, 112, 3, :sattelite
      storage.put x, y, z, t, "some content"
      storage.exists?(x, y, z, t).should be_true
    end
  end
end

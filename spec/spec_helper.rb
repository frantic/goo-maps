require File.join(File.dirname(__FILE__), "../lib/goo_maps.rb")
require 'fileutils'

include GooMaps

def temp_folder
  File.join File.dirname(__FILE__), "test_data"
end

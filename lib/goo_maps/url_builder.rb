module GooMaps
  class UrlBuilder
    def get_url(x, y, z, surface)
      case surface
        when :sattelite then "http://khm1.google.com/kh/v=79&x=#{x}&y=#{y}&z=#{z}"
        when :labels    then "http://mt1.google.com/vt/lyrs=h@145&hl=en&x=#{x}&y=#{y}&z=#{z}"
        else raise "Unsupported surface type: '#{surface}'"
      end
    end
  end
end
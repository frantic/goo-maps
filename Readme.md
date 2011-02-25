Google Maps Downloader
======================

Purpose
-------
Google Maps Downloader can be used to download tiles from Google Maps service
and glue them into one big image file

Installation
------------
This is alpha, there is no gem installer. But you can play with it using `git clone`

    git clone git://github.com/frantic/goo-maps.git
    cd goo-maps/
    bundle install
    rspec --color --f doc spec

If you want to try it in action, go ahead!

    cd bin/
    chmode +x grab-goo-maps.rb
    ./grab-goo-maps.rb 3 /var/temp/

Requiriments
------------
goo-maps library uses `rspec` to test-drive things, out-of-the-box `Net:HTTP` to download
tiles and `mini_magick` to glue that tiles into one big image. For command-line interface (CLI)
it uses `ruby-progressbar` - its very helpful, because "gluing" process is pretty time-consuming

CLI commands
------------
There is only one simple command

    ./bin/grab-goo-maps.rb <zoom_level> <directory>

It is supposed to download all tiles by _zoom level_, store them into _directory_ and glue
in one big `!map.jpg` file. Tiles count depends on zoom level, formulas:

* Big image width and heigh (in tiles): N = 2<sup>Z</sup>
* Image area (in tiles): T = N<sup>2<sup>
* Total required tiles (for sattelite and labels surfaces): K = T * 2

So after a while you'll get K tiles in _directory_

It supports HTTP proxy servers, just set `$http_proxy` environment variable

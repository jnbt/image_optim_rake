# image_optim_rake

[![Build Status](https://api.travis-ci.org/jnbt/image_optim_rake.png?branch=master)](https://travis-ci.org/jnbt/image_optim_rake)

A simple wrapper around [image_optim](https://github.com/toy/image_optim) to batch minify all images in one or more directories.

Designed to work with Rails and per default recursively looks for JPGs and PNGs in `app\assets\images` and `public`.

## Installation

Add this line to your application's Gemfile:

    gem 'image_optim_rake'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install image_optim_rake


## Binary installation

As above mentions this gem uses image_optim, which itself relies on some binary tools. These must be present at the system, but `pngout` is disabled here per default.

### Linux - Debian/Ubuntu

    sudo apt-get install -y advancecomp gifsicle jpegoptim libjpeg-progs optipng pngcrush

### Linux - RHEL/Fedora/Centos

    sudo yum install -y advancecomp gifsicle libjpeg optipng

You will also need to install `jpegoptim` and `pngcrush` from source:

#### jpegoptim

    cd /tmp
    curl -O http://www.kokkonen.net/tjko/src/jpegoptim-1.2.4.tar.gz
    tar zxf jpegoptim-1.2.4.tar.gz
    cd jpegoptim-1.2.4
    ./configure && make && make install

#### pngcrush

    cd /tmp
    curl -O http://iweb.dl.sourceforge.net/project/pmt/pngcrush/1.7.43/pngcrush-1.7.43.tar.gz
    tar zxf pngcrush-1.7.43.tar.gz
    cd pngcrush-1.7.43
    make && cp -f pngcrush /usr/local/bin

### OS X: Macports

    sudo port install advancecomp gifsicle jpegoptim jpeg optipng pngcrush

### OS X: Brew

    brew install advancecomp gifsicle jpegoptim jpeg optipng pngcrush

### pngout installation (optional)

You can install `pngout` by downloading and installing the [binary versions](http://www.jonof.id.au/kenutils).

_Note: pngout is free to use even in commercial soft, but you can not redistribute, repackage or reuse it without consent and agreement of creator. [license](http://advsys.net/ken/utils.htm#pngoutkziplicense)_

**Copied from:** [https://github.com/toy/image_optim/](https://github.com/toy/image_optim/)

## Usage

Change to your project directory and run:

    $ rake image_optim:minify

You can define the directories where images will be searched **recursively** by setting a `dirs` argument:

    $ rake image_optim:minify dirs=app/assets/images,public,lib/assets/images,vendor/assets/images

## Configuration

You can modify the configuration which is passed to image_optim:

    ImageOptimRake::ImageOptimTask.config = {
        :threads => true,
        :pngout  => false
    }

You can also modify the default paths:

    ImageOptimTask.dirs   = ["app/assets/images", "public"]

A good place would be an initializer in a Rails environment.

## Test

    $ rake test

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


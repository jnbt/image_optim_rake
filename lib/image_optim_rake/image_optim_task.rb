require 'rake'
require 'rake/tasklib'
require 'image_optim_rake/minifier'

module ImageOptimRake
  class ImageOptimTask < ::Rake::TaskLib
    class << self
      attr_accessor :dirs, :config
    end

    attr_accessor :name

    def initialize(name = :image_optim)
      @name = name
      yield self if block_given?
      define
    end

    def define
      namespace name do
        desc "Minify all images found under /app/assets/images and /public/images"
        task :minify => :environment do
          dirs = ENV["dirs"] ? ENV["dirs"].split(",") : self.class.dirs
          Minifier.new(dirs, self.class.config).process!
        end
      end
    end
  end

  ImageOptimTask.dirs   = ["app/assets/images", "public"]
  # Configure with :threads => true leads to auto-detection
  ImageOptimTask.config = {
    :threads => true,
    :pngout  => false
  }
end

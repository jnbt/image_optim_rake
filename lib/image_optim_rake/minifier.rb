require "image_optim_rake/image"
require "image_optim"
require "progressbar"

module ImageOptimRake
  class Minifier
    attr_reader :dirs, :total_count, :total_size, :config

    def initialize(dirs, config)
      @dirs        = Hash[dirs.map{|d| [d, []]}]
      @total_count = 0
      @total_size  = 0
      @config      = config
    end

    def process!
      collect_images
      log_images
      process_images!
      log_results
    end

    private

    def collect_images
      dirs.each do |dir, images|
        Dir.glob(File.join(dir,"**","*.{jpg,jpeg,png}")) do |image_file|
          image        = Image.new(image_file)
          images       << image
          @total_size  += image.original_size
          @total_count += 1
        end
      end
    end

    def process_images!
      progress = ::ProgressBar.new("Miniying", total_size)
      processor = ::ImageOptim.new(config)
      dirs.values.flatten.each do |image_file|
        processor.optimize_image!(image_file.path)
        image_file.reload_size!
        progress.inc
      end
      progress.finish
    end

    def log_images
      puts "Minifying total #{total_count} images at: "
      dirs.each do |dir, images|
        puts "- #{dir}: #{images.size} file(s)"
      end
      puts ""
      puts "Grab a coffee now. This may take a while."
      puts ""
    end

    def log_results
      puts ""
      puts "Finished minifying images of total original size: %.2d KB" % (total_size / 1024)
      puts ""
      new_total_size = dirs.values.flatten.map(&:compressed_size).reduce(&:+).to_f
      percentage     = total_size - new_total_size == 0 ? 0.0 : (total_size - new_total_size).to_f / total_size.to_f * 100.0
      puts "New total size: %.2d KB (%2.2f%%):" % [new_total_size / 1024, percentage]
      dirs.values.flatten.each do |image|
        puts "- #{image.path}: %2.2d%%" % image.percentage
      end
    end
  end
end

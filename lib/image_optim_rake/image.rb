module ImageOptimRake
  class Image < Struct.new(:path, :original_size, :compressed_size)
    def initialize(path)
      self.path          = path
      self.original_size = open(path, "rb").size
    end

    def reload_size!
      self.compressed_size = open(path, "rb").size
    end

    def percentage
      (original_size - compressed_size) == 0 ? 0.0 : (original_size - compressed_size).to_f / original_size.to_f * 100.0
    end
  end
end

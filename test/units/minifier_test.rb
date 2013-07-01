require "helper"

class MinifierTest < Testem
  let(:dirs){ ["test/fixtures/"] }

  test "initializes from dirs and config" do
    minifier = ImageOptimRake::Minifier.new(dirs, :foo => :bar)
    expected = {"test/fixtures/" => []}
    assert_equal expected, minifier.dirs
    expected = {:foo => :bar}
    assert_equal expected, minifier.config
    assert_equal 0,        minifier.total_size
    assert_equal 0,        minifier.total_count
  end

  test "process!" do
    sizes = {}

    Dir.mktmpdir("image_optim_rake") do |dir|
      FileUtils.cp_r dirs[0], dir

      Dir.glob(File.join(dir, "**/*.{jpg,png}")).each do |file|
        sizes[file] = open(file, "rb").size
      end

      minifier = ImageOptimRake::Minifier.new([dir], minify_options)
      minifier.process!

      Dir.glob(File.join(dir, "**/*.{jpg,png}")).each do |file|
        assert sizes[file] > open(file, "rb").size, "should have reduced the file size"
      end
    end
  end

  private

  def minify_options
    # we cannot use pngout on travis CI as this is a binary
    # which cannot be included in the build process
    {
      :threads => true,
      :pngout  => !ENV['CI']
    }
  end
end

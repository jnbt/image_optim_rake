require "helper"

class ImageTest < Testem

  let(:image){ ImageOptimRake::Image.new("test/fixtures/unprocessed.jpg")}

  test "load from image path" do
    assert_equal "test/fixtures/unprocessed.jpg", image.path
    assert_equal 66388, image.original_size
    assert_equal nil,   image.compressed_size
  end

  test "reload_size!" do
    assert_equal nil,   image.compressed_size
    image.reload_size!
    assert_equal 66388, image.compressed_size
  end

  test "percentage" do
    image.original_size   = 100
    image.compressed_size = 50
    assert_equal 50, image.percentage
  end
end

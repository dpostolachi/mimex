defmodule MimeTest do
  use ExUnit.Case
  doctest Mime

  @chunk_size 4
  @jpg_file "test/images/image.jpg"
  @bmp_file "test/images/image.bmp"
  @gif_file "test/images/image.gif"
  @png_file "test/images/image.png"
  @tiff_file "test/images/image.tiff"
  @webp_file "test/images/image.webp"

  test "check mime type for images" do
    # JPEG
    { :ok, file } = File.open( @jpg_file )
    binary = IO.binread( file, @chunk_size )
    assert Mime.check_image( binary ) == :jpeg

    # BMP
    { :ok, file } = File.open( @bmp_file )
    binary = IO.binread( file, @chunk_size )
    assert Mime.check_image( binary ) == :bmp

    # GIF
    { :ok, file } = File.open( @gif_file )
    binary = IO.binread( file, @chunk_size )
    assert Mime.check_image( binary ) == :gif

    # PNG
    { :ok, file } = File.open( @png_file )
    binary = IO.binread( file, @chunk_size )
    assert Mime.check_image( binary ) == :png

    # TIFF
    { :ok, file } = File.open( @webp_file )
    binary = IO.binread( file, @chunk_size )
    assert Mime.check_image( binary ) == :webp

    # WEBP

  end
end

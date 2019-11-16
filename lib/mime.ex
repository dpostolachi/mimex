defmodule Mime do
  @moduledoc """
  Documentation for Mime.
  """

  def check_image( bytes ) do
    case :binary.part( bytes, 0, 4 ) do
      << 82, 73, 70, 70 >> -> :webp #WEBP
      << 71, 73, 70, _ >> -> :gif #GIF
      << 66, 77, _, _ >> -> :bmp #BMP
      << 137, 80, 78, 71 >> -> :png #PNG
      << 255, 216, 255, 224 >> -> :jpeg #JPEG
      << 255, 216, 255, 225 >> -> :jpeg #JPEG
      << 73, 73, 42, _ >> -> :tiff #TIFF
      << 77, 77, 43, _ >> -> :tiff #TIFF
    end
  end

end

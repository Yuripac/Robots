module Drawable

  attr_writer :x, :y

  def x
    @x ||= 0
  end

  def y
    @y ||= 0
  end

  # Default symbol
  def draw
    "o"
  end

end
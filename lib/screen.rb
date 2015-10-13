require './lib/runnable.rb'

class Screen

  attr_reader :width, :height, :elements

  include Runnable

  def initialize(width, height, elements = [])
    @width = width
    @height = height
    @elements = elements
    rand_position_elements
  end

  # Overrides the Runnable's method
  # The engine will runs that
  def run
    draw
  end

  def draw
    system('clear')
    screen = build_screen

    screen.each do |row|
      puts row.join
    end
  end

  private

  def rand_position_elements # TODO: needs to be deleted
    @elements.each do |element|
      element.x = rand(0...width)
      element.y = rand(0...height)
    end
  end

  def build_screen
    screen = []

    # Build screen
    height.times do
      row = []
      width.times do
        row << "."
      end
      screen << row
    end

    # Draw elements in screen
    draw_elements(screen)

    return screen
  end

  def draw_elements(screen)
    elements.each do |element|

      # When the element position is greater than screen width or height
      # the element's position is updated
      element.x = element.x >= width ? element.x % width : element.x
      element.y = element.y >= height ? element.y % height : element.y

      #When the element position less than screen width or height
      # the element's position is updated
      element.x = element.x < 0 ? width + element.x : element.x
      element.y = element.y < 0 ? height + element.y : element.y

      #screen[x][y] = element.draw
      screen[element.y][element.x] = element.draw
    end
  end
end
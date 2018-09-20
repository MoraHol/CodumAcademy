require_relative 'Commands.class'
# canvas class to draw lines, rectangles and fill with color
class Canvas
  def initialize(width, height)
    @drawing_space = [height][width]
    @commands = Commands.new(self)
  end
  attr_accessor :commands, :drawing_space
end

require_relative 'Commands.class'
# canvas class to draw lines, rectangles and fill with color
class Canvas
  def initialize(height, width)
    @width = width.to_i
    @height = height.to_i
    @drawing_space = Array.new(height.to_i) { Array.new(width.to_i) }
    initialize_canvas
    @commands = Commands.new(self)
  end
  attr_accessor :commands, :drawing_space, :width, :height

  protected

  def initialize_canvas
    canvas = @drawing_space
    for i in (0..@height - 1)
      for j in (0..@width - 1)
        if i == 0 then canvas[i][j] = -1
        elsif i == @height - 1 then canvas[i][j] = -1
        elsif j == 0 then canvas[i][j] = -1
        elsif j == @width - 1 then canvas[i][j] = -1
        else
          canvas[i][j] = 0
        end
      end
    end
    @drawing_space = canvas
  end
end

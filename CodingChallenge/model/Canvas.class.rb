require_relative 'Commands.class'
# canvas class to draw lines, rectangles and fill with color
class Canvas
  def initialize(height, width)
    @width = width.to_i + 2
    @height = height.to_i + 2
    @drawing_space = Array.new(@height) { Array.new(@width) }
    initialize_canvas
    @commands = Commands.new(self)
  end
  attr_accessor :commands, :drawing_space, :width, :height

  protected

  def initialize_canvas
    canvas = @drawing_space
    for i in (0..@height - 1)
      for j in (0..@width - 1)
        canvas[i][j] = if i.zero? then -1
                       elsif i == @height - 1 then -1
                       elsif j.zero? then -1
                       elsif j == @width - 1 then -1
                       else
                         0
                       end
      end
    end
    @drawing_space = canvas
  end
end

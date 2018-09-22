require_relative '../model/Canvas.class'
# class responsible for drawing on the canvas
class Painter
  attr_accessor(:canvas, :canvas_exist)

  def initialize(terminal)
    @terminal = terminal
    @canvas_exist = false
    @canvas = nil
  end

  def create_new_canvas(height, width)
    @canvas = Canvas.new(height, width)
    @canvas_exist = true
    puts 'It was created correctly'
  end

  def new_line(command)
    if command[1] == command[3]
      line_shape = :horizontal
    elsif command [2] == command[4]
      line_shape = :vertical
    else
      puts 'The line you are trying to create is not horizontal or vertical'
      return
    end
    @canvas.commands.new_line(command[1], command[2], command[3], command[4], line_shape)
  end

  def new_rectangule(command)
    @canvas.commands.new_rectangule(command[1], command[2], command[3], command[4])
  end

  def fill(command)
    @canvas.commands.fill(command[1], command[2], command[3])
  end
end

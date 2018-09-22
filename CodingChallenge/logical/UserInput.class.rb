# responsible for validating that the user input
# is a valid command for the application
class UserInput
  def initialize(drawing_tool)
    @drawing_tool = drawing_tool
  end

  def validate_command(command)
    command = command.split
    case command[0]
    when 'C' then validate_canvas(command)
    when 'L' then validate_line(command)
    when 'R' then validate_rectangule(command)
    when 'B' then validate_fill(command)
    else
      error_sintax
    end
  end

  def error_sintax
    puts 'the inserted command is not correct: '
    puts 'C [w] [h]           Should create a new canvas of width w and height h. '
    puts "L [x1][y1][x2][y2]               Should create a new line from (x1,y1) to (x2,y2). Currently only horizontal or vertical lines are supported. Horizontal and vertical lines will be drawn
    using the 'x' character. "
    puts "R [x1][y1][x2][y2]         Should create a new rectangle, whose upper left corner is (x1,y1) and
    lower right corner is (x2,y2). Horizontal and vertical lines will be drawn
    using the 'x' character."
    puts "B [x][y][c]     Should fill the entire area connected to (x,y) with 'colour' c. The behaviour
    of this is the same as that of the 'bucket fill' tool in paint programs. "
    puts 'Q                  Should quit the program. '
  end

  protected

  def validate_canvas(command)
    if command.size == 3
      @drawing_tool.painter.create_new_canvas(command[1], command[2])
    else
      puts 'missing arguments for this command:'
      puts 'C [w] [h]'
    end
  end

  def validate_line(command)
    if command.size == 5
      if @drawing_tool.painter.canvas_exist == true
        @drawing_tool.painter.new_line(command)
      else
        puts 'no canvas has been created'
      end
    else
      puts 'missing arguments for this command:'
      puts 'L [x1][y1][x2][y2]'
    end
  end
  # validate that the rectangle command has the necessary parameters
  # Params:

  def validate_rectangule(command)
    if command.size == 5
      if @drawing_tool.painter.canvas_exist == true
        @drawing_tool.painter.new_rectangule(command)
      else
        puts 'no canvas has been created'
      end
    else
      puts 'missing arguments for this command:'
      puts 'R [x1][y1][x2][y2]'
    end
  end

  def validate_fill(command)
    if command.size == 4
      @drawing_tool.painter.fill(command)
    else
      puts 'missing arguments for this command:'
      puts 'B [x][y][c]'
    end
  end
end

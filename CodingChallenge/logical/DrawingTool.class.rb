require_relative 'UserInput.class'
require_relative 'Painter.class'
require_relative '../GUI/ConsolePrint'
# control input and output
class DrawingTool
  attr_accessor :painter, :flag
  def initialize
    @user_input = UserInput.new(self)
    @painter = Painter.new(self)
    @console_print = ConsolePrint.new(@painter.canvas)
  end
  # Start the application
  def run
    puts 'the program is running'
    loop do
      print '> '
      input = gets.chomp
      exit if input.split[0] == 'Q'
      @user_input.validate_command(input)
      @console_print.canvas = @painter.canvas
      @console_print.show_canvas
    end
  end
end

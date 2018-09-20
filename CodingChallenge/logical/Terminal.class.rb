require_relative 'CommandReader.class'
require_relative 'Painter.class'
# control input and output
class InputController
  attr_accessor :painter
  def initialize
    @command_reader = CommandReader.new(self)
    @painter = Painter.new
    @flag = false
  end

  def input_reader
    until @flag
      input = gets.chomp
      @command_reader.validate_command(input)
    end
  end
end

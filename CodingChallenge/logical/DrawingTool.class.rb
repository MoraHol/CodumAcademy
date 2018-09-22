require_relative 'InputUser.class'
require_relative 'Painter.class'
require_relative '../GUI/ConsolePrint'
# control input and output
class DrawingTool
  attr_accessor :painter, :flag
  def initialize
    @command_reader = InputUser.new(self)
    @painter = Painter.new(self)
    @shower = ConsolePrint.new(@painter.canvas)
    @flag = false
  end

  def run
    until @flag
      input = gets.chomp
      @command_reader.validate_command(input)
      @shower.canvas = @painter.canvas
      @shower.show_canvas
    end
  end
end

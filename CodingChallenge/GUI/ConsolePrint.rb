require_relative '../logical/InputUser.class'
require_relative '../model/Canvas.class'
require_relative '../logical/InputUser.class'
require_relative '../logical/Painter.class'
require_relative '../model/Commands.class'
class ConsolePrint
  attr_accessor :canvas
  def initialize(canvas)
    @canvas = canvas
  end

  def show_canvas
    if @canvas != nil
      matrix = @canvas.drawing_space
      # for i in (0..@canvas.height - 1)
      #   for j in (0..@canvas.width - 1)
      #     if matrix[i][j].zero? then print ' '
      #     elsif matrix[i][j] == 1 then print 'X'
      #     elsif matrix[i][j] == -1 then print '-'
      #     else print matrix[i][j]
      #     end
      #   end
      #   puts ' '
      # end
      matrix.each do |arrow|
        print arrow
        puts
      end
    end
  end
end

# responsible for transforming the logical canvas into a drawing that is
# understandable to the user
class ConsolePrint
  attr_accessor :canvas
  def initialize(canvas)
    @canvas = canvas
  end

  # show the canvas in the console

  def show_canvas
    unless @canvas.nil?
      matrix = @canvas.drawing_space
      for i in (0..@canvas.height - 1)
        for j in (0..@canvas.width - 1)
          if matrix[i][j] == 0 then print ' '
          elsif matrix[i][j] == 1 then print 'X'
          elsif matrix[i][j] == -1 then print '-'
          else print matrix[i][j]
          end
        end
        puts
      end
    end
  end
end

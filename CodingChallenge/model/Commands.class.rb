class Commands

  def initialize(canvas)
    @canvas = canvas
  end

  def new_line(x1,y1,x2,y2,line_shape)
    if line_shape == :horizontal then new_line_horizontal(x1,y1,x2,y2)
    elsif line_shape == :vertical then new_line_vertical(x1,y1,x2,y2)
    end
  end

  def new_rectagule(x1, y1, x2, y2)
    new_line_horizontal(x1, y1, x1, y2)
    new_line_horizontal(x2, y1, x2, y2)
    new_line_vertical(x1, y1, x2, y1)
    new_line_vertical(x2, y1, x2, sy2)
  end

  def fill(x, y, pattern)
    matrix = @canvas.drawing_space
    stack_positions = []
    stack_positions.push(x,y)
    until stack_positions.length == 0
      actual_postion = stack_positions.pop()
      matrix[actual_postion[0]][actual_postion[1]] = pattern
      if matrix[actual_postion[0]-1][actual_postion[1]] == 0
        stack_positions.push(actual_postion[0]-1,actual_postion[1])
      end
      if matrix[actual_postion[0]+1][actual_postion[1]] == 0
        stack_positions.push(actual_postion[0]+1,actual_postion[1])
      end
      if matrix[actual_postion[0]][actual_postion[1]-1] == 0
        stack_positions.push(actual_postion[0],actual_postion[1]-1)
      end
      if matrix[actual_postion[0]][actual_postion[1]+1] == 0
        stack_positions.push(actual_postion[0],actual_postion[1]+1)
      end
    end
  end

  protected

  def new_line_horizontal(x1, y1, x2, y2)
    for i in (y1..y2)
      @canvas.drawing_space[x1][i] = 1
    end
  end

  def new_line_vertical(x1, y1, x2, y2)
    for i in (x1..x2)
      @canvas.drawing_space[i][y1] = 1
    end
  end
end

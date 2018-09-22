canvas = Array.new(10) { Array.new(20) }
canvas[0][0] = 1
canvas[1][2] = 1
canvas.each do |arrow|
    print arrow[0]
    puts
end
print canvas

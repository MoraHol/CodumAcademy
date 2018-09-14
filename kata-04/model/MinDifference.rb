class DataFile
    def initialize()
        @file
        @result
    end
    def diference_goals
        @file = './football.dat'
        @min = 100_000
        min_difference_between(7,9,2)
    end
    def difference_temperature
        @file = './weather.dat'
        @min = 100_000
        min_difference_between(2,3,1)
    end
    protected
    def min_difference_between(col_1,col_2,col_result)
    # array de lineas del archivo
        lines = File.readlines(@file)
        lines.each do |line|
            line = line.split
            # si no se contienen numeros
            if line[col_1 - 1].to_i.zero? || line[col_2 - 1].to_i.zero?
                next
            else
                min_different = line[col_1 - 1].to_i - line[col_2 - 1].to_i
                min_different = min_different < 0 ? min_different * -1 : min_different
                if min_different <= @min
                    @min = min_different
                    @result = line[col_result-1]
                end
            end
        end
    [@result, @min]
    end    
end
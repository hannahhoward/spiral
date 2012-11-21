class Spiral

  def perfect_square?(number)
    sqrt = Math.sqrt(number)
    return (sqrt == sqrt.floor)
  end
  
  def generate_spiral_incrementally(number)
    matrix_size = Math.sqrt(number).floor
    if matrix_size == 1
      [[1]]
    else
      one_size_smaller = (matrix_size-1)*(matrix_size-1)
      matrix = generate_spiral_incrementally(one_size_smaller)
      current_number = one_size_smaller + 1
      if matrix_size.even?
      
        #walk up on right
        (matrix_size - 2).downto(0) do |i|
          matrix[i].push(current_number)
          current_number += 1
        end
        
        #walk left on top
        top_row = Array.new(matrix_size)
        (matrix_size - 1).downto(0) do |i|
          top_row[i] = current_number
          current_number += 1
        end
        matrix.insert(0, top_row)
      else
      
        #walk down on left
        (0..(matrix_size-2)).each do |i|
          matrix[i].insert(0,current_number)
          current_number+=1
        end
        bottom_row = Array.new(matrix_size)
        
        #walk right on bottom
        (0..(matrix_size-1)).each do |i|
          bottom_row[i] = current_number
          current_number+=1
        end
        matrix.push(bottom_row)
      end
      matrix
    end
    
  end
  
  def matrix
    @matrix
  end
  
  def generate(number)
    @number = number
    if perfect_square?(number)
      @matrix = generate_spiral_incrementally(number)
    else
      @matrix = nil
    end
  end
  
  def print
    if !@matrix
      $stdout.puts("Please give a number that is a perfect square")
    else
      digits = @number.to_s.length
      @matrix.each do |row|
        line = row.map do |element|
          element.to_s + Array.new(digits-element.to_s.length, " ").join("")
        end.join(" ")
        $stdout.puts(line)
      end
    end
  end
  
end

DIRECTIONS = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze

def flood_fill(image, start_row, start_col, color)
  return image if image.empty? || image[0].empty?

  original_color = image[start_row][start_col]
  return image if original_color == color

  queue = [[start_row, start_col]]
  image[start_row][start_col] = color
  head = 0

  while head < queue.size
    row, col = queue[head]
    head += 1

    DIRECTIONS.each do |row_delta, col_delta|
      next_row = row + row_delta
      next_col = col + col_delta

      next unless inside?(image, next_row, next_col)
      next if image[next_row][next_col] != original_color

      image[next_row][next_col] = color
      queue << [next_row, next_col]
    end
  end

  image
end

def inside?(image, row, col)
  row >= 0 &&
    row < image.size &&
    col >= 0 &&
    col < image[0].size
end

if __FILE__ == $0
  test1 = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]
  result1 = flood_fill(test1, 1, 1, 2)
  puts result1.map { |row| row.join(",") }
  # Expected: [[2,2,2],[2,2,0],[2,0,1]]

  test2 = [[0, 0, 0], [0, 0, 0]]
  result2 = flood_fill(test2, 0, 0, 0)
  puts result2.map { |row| row.join(",") }
  # Expected: [[0,0,0],[0,0,0]]
end

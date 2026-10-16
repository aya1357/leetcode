DIRECTIONS = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze

def pacific_atlantic(heights)
  return [] if heights.empty? || heights[0].empty?

  rows = heights.size
  cols = heights[0].size
  pacific_reachable = Array.new(rows) { Array.new(cols, false) }
  atlantic_reachable = Array.new(rows) { Array.new(cols, false) }

  rows.times do |row|
    mark_reachable(heights, pacific_reachable, row, 0)
    mark_reachable(heights, atlantic_reachable, row, cols - 1)
  end

  cols.times do |col|
    next if col.zero? || col == cols - 1
    mark_reachable(heights, pacific_reachable, 0, col)
    mark_reachable(heights, atlantic_reachable, rows - 1, col)
  end

  result = []
  rows.times do |row|
    cols.times do |col|
      next unless pacific_reachable[row][col]
      next unless atlantic_reachable[row][col]
      result << [row, col]
    end
  end

  result
end

def mark_reachable(heights, reachable, start_row, start_col)
  return if reachable[start_row][start_col]

  queue = [[start_row, start_col]]
  reachable[start_row][start_col] = true
  head = 0

  while head < queue.size
    row, col = queue[head]
    head += 1

    DIRECTIONS.each do |row_delta, col_delta|
      next_row = row + row_delta
      next_col = col + col_delta

      next unless inside?(heights, next_row, next_col)
      next if reachable[next_row][next_col]
      next if heights[next_row][next_col] < heights[row][col]

      reachable[next_row][next_col] = true
      queue << [next_row, next_col]
    end
  end
end

def inside?(heights, row, col)
  row >= 0 &&
    row < heights.size &&
    col >= 0 &&
    col < heights[0].size
end

if __FILE__ == $0
  test1 = [[1, 2, 2, 3, 5], [3, 2, 3, 4, 4], [2, 4, 5, 3, 1], [6, 7, 1, 4, 5], [5, 1, 1, 2, 4]]
  result1 = pacific_atlantic(test1)
  puts result1.map { |coord| "[#{coord[0]},#{coord[1]}]" }.join(",")
  # Expected: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]

  test2 = [[1]]
  result2 = pacific_atlantic(test2)
  puts result2.map { |coord| "[#{coord[0]},#{coord[1]}]" }.join(",")
  # Expected: [[0,0]]
end

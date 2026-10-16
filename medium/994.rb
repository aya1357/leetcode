DIRECTIONS = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze

def oranges_rotting(grid)
  return 0 if grid.empty? || grid[0].empty?

  rows = grid.size
  cols = grid[0].size
  queue = []
  fresh_count = 0

  rows.times do |row|
    cols.times do |col|
      if grid[row][col] == 2
        queue << [row, col]
      elsif grid[row][col] == 1
        fresh_count += 1
      end
    end
  end

  return 0 if fresh_count.zero?

  minutes = 0
  head = 0

  while head < queue.size
    # 現在のレベル（=1分）で処理するオレンジ数
    level_size = queue.size - head

    level_size.times do
      row, col = queue[head]
      head += 1

      DIRECTIONS.each do |row_delta, col_delta|
        next_row = row + row_delta
        next_col = col + col_delta

        next unless inside?(grid, next_row, next_col)
        next if grid[next_row][next_col] != 1

        grid[next_row][next_col] = 2
        fresh_count -= 1
        queue << [next_row, next_col]
      end
    end

    minutes += 1 if head < queue.size
  end

  fresh_count.zero? ? minutes : -1
end

def inside?(grid, row, col)
  row >= 0 &&
    row < grid.size &&
    col >= 0 &&
    col < grid[0].size
end

if __FILE__ == $0
  test1 = [[2, 1, 1], [1, 1, 0], [0, 1, 1]]
  puts oranges_rotting(test1)  # Expected: 4

  test2 = [[2, 1, 1], [0, 1, 1], [1, 0, 1]]
  puts oranges_rotting(test2)  # Expected: -1

  test3 = [[0, 2]]
  puts oranges_rotting(test3)  # Expected: 0
end

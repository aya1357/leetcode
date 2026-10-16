DIRECTIONS = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze

def num_islands(grid)
  return 0 if grid.empty? || grid[0].empty?

  rows = grid.size
  cols = grid[0].size
  visited = Array.new(rows) { Array.new(cols, false) }
  count = 0

  rows.times do |row|
    cols.times do |col|
      next if grid[row][col] == '0'
      next if visited[row][col]

      visit_island(grid, visited, row, col)
      count += 1
    end
  end

  count
end

def inside?(grid, row, col)
  row >= 0 && row < grid.size && col >= 0 && col < grid[0].size
end

def visit_island(grid, visited, start_row, start_col)
  queue = [[start_row, start_col]]
  visited[start_row][start_col] = true
  head = 0

  while head < queue.size
    row, col = queue[head]
    head += 1

    DIRECTIONS.each do |row_delta, col_delta|
      next_row = row + row_delta
      next_col = col + col_delta

      next unless inside?(grid, next_row, next_col)
      next if visited[next_row][next_col]
      next if grid[next_row][next_col] == '0'

      visited[next_row][next_col] = true
      queue << [next_row, next_col]
    end
  end
end

if __FILE__ == $0
  test1 = [
    ["1", "1", "1", "1", "0"],
    ["1", "1", "0", "1", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "0", "0", "0"]
  ]
  puts num_islands(test1)  # Expected: 1

  test2 = [
    ["1", "1", "0", "0", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "1", "0", "0"],
    ["0", "0", "0", "1", "1"]
  ]
  puts num_islands(test2)  # Expected: 3
end

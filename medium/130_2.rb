DIRECTIONS = [[1, 0], [-1, 0], [0, 1], [0, -1]].freeze

def solve(board)
  return if board.empty? || board[0].empty?

  rows = board.size
  cols = board[0].size

  rows.times do |row|
    mark_safe_region(board, row, 0) if board[row][0] == 'O'
    mark_safe_region(board, row, cols - 1) if board[row][cols - 1] == 'O'
  end

  cols.times do |col|
    next if col.zero? || col == cols - 1
    mark_safe_region(board, 0, col) if board[0][col] == 'O'
    mark_safe_region(board, rows - 1, col) if board[rows - 1][col] == 'O'
  end

  rows.times do |row|
    cols.times do |col|
      case board[row][col]
      when 'O'
        board[row][col] = 'X'
      when '#'
        board[row][col] = 'O'
      end
    end
  end
end

def inside?(board, row, col)
  row >= 0 &&
    row < board.size &&
    col >= 0 &&
    col < board[0].size
end

def mark_safe_region(board, start_row, start_col)
  stack = [[start_row, start_col]]
  board[start_row][start_col] = '#'

  until stack.empty?
    row, col = stack.pop

    DIRECTIONS.each do |row_delta, col_delta|
      next_row = row + row_delta
      next_col = col + col_delta

      next unless inside?(board, next_row, next_col)
      next unless board[next_row][next_col] == 'O'

      board[next_row][next_col] = '#'
      stack.push([next_row, next_col])
    end
  end
end

if __FILE__ == $0
  test1 = [
    ["X", "X", "X", "X"],
    ["X", "O", "O", "X"],
    ["X", "X", "O", "X"],
    ["X", "O", "X", "X"]
  ]
  solve(test1)
  puts test1.map { |row| row.join(",") }
  # Expected: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]

  test2 = [["X"]]
  solve(test2)
  puts test2.map { |row| row.join(",") }
  # Expected: [["X"]]
end

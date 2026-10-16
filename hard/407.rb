class MinHeap
  def initialize
    @arr = []
  end

  def push(val)
    @arr << val
    idx = @arr.size - 1
    while idx > 0
      parent_idx = (idx - 1) / 2
      break if @arr[idx][0] >= @arr[parent_idx][0]
      @arr[idx], @arr[parent_idx] = @arr[parent_idx], @arr[idx]
      idx = parent_idx
    end
  end

  def pop
    return nil if @arr.empty?
    min = @arr[0]
    last = @arr.pop

    unless @arr.empty?
      @arr[0] = last
      idx = 0
      loop do
        left = 2 * idx + 1
        right = 2 * idx + 2
        smallest = idx
        smallest = left if left < @arr.size && @arr[left][0] < @arr[smallest][0]
        smallest = right if right < @arr.size && @arr[right][0] < @arr[smallest][0]
        break if smallest == idx
        @arr[idx], @arr[smallest] = @arr[smallest], @arr[idx]
        idx = smallest
      end
    end
    min
  end

  def empty?
    @arr.empty?
  end
end

DIRECTIONS = [[0, 1], [1, 0], [0, -1], [-1, 0]]

def trap_rain_water(height_map)
  return 0 if height_map.empty? || height_map[0].empty?

  rows = height_map.length
  cols = height_map[0].length

  visited = Array.new(rows) { Array.new(cols, false) }
  heap = MinHeap.new

  rows.times do |row|
    heap.push([height_map[row][0], row, 0])
    visited[row][0] = true
    heap.push([height_map[row][cols - 1], row, cols - 1])
    visited[row][cols - 1] = true
  end

  cols.times do |col|
    next if col == 0 || col == cols - 1
    heap.push([height_map[0][col], 0, col])
    visited[0][col] = true
    heap.push([height_map[rows - 1][col], rows - 1, col])
    visited[rows - 1][col] = true
  end

  trapped_water = 0

  until heap.empty?
    current_level, row, col = heap.pop

    DIRECTIONS.each do |row_delta, col_delta|
      next_row = row + row_delta
      next_col = col + col_delta

      next if next_row < 0 || next_row >= rows || next_col < 0 || next_col >= cols || visited[next_row][next_col]

      visited[next_row][next_col] = true
      cell_height = height_map[next_row][next_col]
      trapped_water += [current_level - cell_height, 0].max
      heap.push([[current_level, cell_height].max, next_row, next_col])
    end
  end

  trapped_water
end

if __FILE__ == $0
  test1 = [[1, 4, 3, 1, 3, 2], [3, 2, 1, 3, 2, 4], [2, 3, 3, 2, 3, 1]]
  puts trap_rain_water(test1)  # Expected: 4

  test2 = [[3, 3, 3, 3, 3], [3, 2, 2, 2, 3], [3, 2, 1, 2, 3], [3, 2, 2, 2, 3], [3, 3, 3, 3, 3]]
  puts trap_rain_water(test2)  # Expected: 10
end

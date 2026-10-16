def trap(height)
  return 0 if height.size < 3

  n = height.size
  left_max = Array.new(n)
  right_max = Array.new(n)

  left_max[0] = height[0]
  (1...n).each do |i|
    left_max[i] = [left_max[i - 1], height[i]].max
  end

  right_max[n - 1] = height[n - 1]
  (n - 2).downto(0) do |i|
    right_max[i] = [right_max[i + 1], height[i]].max
  end

  trapped_water = 0
  n.times do |i|
    water_level = [left_max[i], right_max[i]].min
    trapped_water += water_level - height[i]
  end

  trapped_water
end

if __FILE__ == $0
  test1 = [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]
  puts trap(test1)  # Expected: 6

  test2 = [4, 2, 0, 3, 2, 5]
  puts trap(test2)  # Expected: 9
end

# @param {Integer[]} nums
# @return {Integer[]}
# 時間計算量: O(n) - 両端から1回ずつ要素を見る
# 空間計算量: O(n) - 結果配列 result
def sorted_squares(nums)
  i = 0
  j = nums.length - 1
  k = nums.length - 1
  result = Array.new(nums.length, 0)
  while i <= j
      i_square = nums[i] * nums[i]
      j_square = nums[j] * nums[j]
      if i_square >= j_square
          result[k] = i_square
          i += 1
      else
          result[k] = j_square
          j -= 1
      end
      k -= 1
  end
  result
end

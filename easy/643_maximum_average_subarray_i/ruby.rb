# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
# 時間計算量: O(n) - 初期和が O(k)、以降のスライドが O(n - k)
# 空間計算量: O(1) - sum / max_sum のみ（※ nums[0, k] は一時的に長さ k の配列を作る）
def find_max_average(nums, k)
  sum = nums[0, k].sum
  max_sum = sum
  (k...nums.length).each do |i|
    sum += nums[i] - nums[i - k]
    max_sum = [max_sum, sum].max
  end
  max_sum.to_f / k
end

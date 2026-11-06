# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
# 時間計算量: O(n) - 配列を1回走査する。Hash の参照・更新は平均 O(1)
# 空間計算量: O(n) - 各値の最新インデックスを Hash に保持する
def contains_nearby_duplicate(nums, k)
  seen = {}

  nums.each_with_index do |num, i|
      return true if seen.key?(num) && i - seen[num] <= k

      seen[num] = i
  end
  false
end

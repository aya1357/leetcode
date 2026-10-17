# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# 時間計算量: O(n) - 配列を1回走査し、Hashの検索・追加は平均O(1)
# 空間計算量: O(n) - 配列の要素数に応じてHashにデータを保存する
def two_sum(nums, target)
  seen = {}
  nums.each_with_index do |num, i|
      diff = target - num
      return [seen[diff], i] if seen.key?(diff)

      seen[num] = i
  end
end

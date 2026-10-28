# 解法1: uniq! で重複を除き、残った要素数を返す
# @param {Integer[]} nums
# @return {Integer}
# 時間計算量: O(n) - 各要素を1回見て一意化する（平均）
# 空間計算量: O(n) - 内部で出現済みを記録するハッシュを使う
def remove_duplicates(nums)
  nums.uniq!
  nums.count
end

# 解法2: ソート済みを利用した2ポインタ（追加配列なし）
# @param {Integer[]} nums
# @return {Integer}
# 時間計算量: O(n) - 配列を1回走査する
# 空間計算量: O(1) - ポインタ k のみ使用
def remove_duplicates(nums)
  return 0 if nums.empty?

  k = 1

  (1...nums.length).each do |i|
    if nums[i] != nums[k - 1]
      nums[k] = nums[i]
      k += 1
    end
  end
  k
end

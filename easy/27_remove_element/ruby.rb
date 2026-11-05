# 解法1: delete で val を取り除く
# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
# 時間計算量: O(n) - 配列を走査して val を取り除く
# 空間計算量: O(1) - delete は in-place（※ compact は ! なしなので nums には影響しない）
def remove_element(nums, val)
  nums.delete(val)
  nums.compact
  nums.size
end

# 解法2: 2ポインタで val 以外を前に詰める
# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
# 時間計算量: O(n) - 配列を1回走査する
# 空間計算量: O(1) - ポインタ k のみ使用
def remove_element(nums, val)
  k = 0

  nums.each do |num|
    next if num == val

    nums[k] = num
    k += 1
  end
  k
end

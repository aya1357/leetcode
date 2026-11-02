# 解法1: 二分探索（見つかったら即 return、末尾より大きい場合は早期 return）
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# 時間計算量: O(log n) - 毎回探索範囲を半分にする
# 空間計算量: O(1) - left / right / mid のみ使用
def search_insert(nums, target)
  left = 0
  right = nums.length - 1
  return nums.length if nums.last < target

  while left < right
    mid = left + (right - left) / 2
    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      left = mid + 1
    else
      right = mid
    end
  end
  left
end

# 解法2: lower_bound（target 以上が最初に現れる位置を二分探索）
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# 時間計算量: O(log n) - 毎回探索範囲を半分にする
# 空間計算量: O(1) - left / right / mid のみ使用
def search_insert(nums, target)
  left = 0
  right = nums.length

  # target以上の値が最初に現れる位置を二分探索
  while left < right
    mid = (left + right) / 2

    if nums[mid] < target
      left = mid + 1 # targetより小さいので右側を探索
    else
      right = mid    # target以上なのでmidより右側は探索しない
    end
  end

  left # targetの位置、または挿入位置
end

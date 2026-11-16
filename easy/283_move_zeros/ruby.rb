# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
# 時間計算量: O(n) - 配列を1回走査する
# 空間計算量: O(1) - insert_index のみ使用（in-place で入れ替え）
def move_zeroes(nums)
  insert_index = 0

  nums.each_with_index do |num, index|
      next if num == 0

      nums[insert_index], nums[index] = nums[index], nums[insert_index]
      insert_index += 1
  end
end

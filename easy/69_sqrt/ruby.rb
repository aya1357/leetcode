# @param {Integer} x
# @return {Integer}
# 時間計算量: O(log x) - 二分探索で探索範囲を半分にする
# 空間計算量: O(1) - left / right / mid のみ使用
def my_sqrt(x)
  left = 0
  right = x
  while left <= right
      mid = (right + left) / 2
      if mid * mid <= x
          left = mid + 1
      else
          right = mid - 1
      end
  end
  right
end

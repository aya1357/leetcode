# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
# 時間計算量: O(log n) - 二分探索で探索範囲を半分にする（is_bad_version は O(1) とみなす）
# 空間計算量: O(1) - left / right / mid のみ使用
def first_bad_version(n)
  left = 0
  right = n
  while left < right
      mid = (left + right) / 2
      if is_bad_version(mid)
          right = mid
      else
          left = mid + 1
      end
  end
  left
end

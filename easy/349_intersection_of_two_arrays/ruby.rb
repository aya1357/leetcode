# 解法1: include? で共通要素を集める
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
# 時間計算量: O(n × m) - nums1 の各要素に対し nums2.include? / result.include? が線形走査
# 空間計算量: O(k) - 共通要素を格納する配列
# n, m: 各配列の長さ / k: 共通要素の数
def intersection(nums1, nums2)
  result = []
  nums1.each do |num|
    result << num if !result.include?(num) && nums2.include?(num)
  end
  result
end

# 解法2: Array#&（積集合）を使う
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
# 時間計算量: O(n + m) - 内部で Hash 化して集合演算する（平均）
# 空間計算量: O(n + m) - 集合用の Hash と結果配列
# n, m: 各配列の長さ
def intersection(nums1, nums2)
  nums1 & nums2
end

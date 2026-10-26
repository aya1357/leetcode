# 解法1: DP配列に各段までの通り数を保存する
# @param {Integer} n
# @return {Integer}
# 時間計算量: O(n) - 3 から n まで1回ずつ計算する
# 空間計算量: O(n) - 長さ n+1 の配列を使う
def climb_stairs(n)
  return 1 if n == 1
  return 2 if n == 2

  dep = Array.new(n + 1)
  dep[1] = 1
  dep[2] = 2

  (3..n).each do |i|
    dep[i] = dep[i - 1] + dep[i - 2]
  end

  dep[n]
end

# 解法2: 直前2つだけを変数で持つ（空間を削減）
# @param {Integer} n
# @return {Integer}
# 時間計算量: O(n) - 3 から n まで1回ずつ更新する
# 空間計算量: O(1) - prev / current のみ使用
def climb_stairs(n)
  return n if n <= 2

  prev = 1
  current = 2

  (3..n).each do
    prev, current = current, prev + current
  end

  current
end

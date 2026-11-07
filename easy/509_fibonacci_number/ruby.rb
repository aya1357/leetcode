# 解法1: prev / result を更新しながら計算する
# @param {Integer} n
# @return {Integer}
# 時間計算量: O(n) - 1 から n までループする
# 空間計算量: O(1) - prev / result のみ使用
def fib(n)
  return 0 if n == 0

  prev = 1
  result = 0
  (1..n).each do
    prev_result = result
    result += prev
    prev = prev_result
  end
  result
end

# 解法2: a, b を入れ替えながら計算する
# @param {Integer} n
# @return {Integer}
# 時間計算量: O(n) - n 回ループする
# 空間計算量: O(1) - a / b のみ使用
def fib(n)
  a, b = 0, 1

  n.times do
    a, b = b, a + b
  end

  a
end

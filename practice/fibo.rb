# 解法1: 再帰
# 時間計算量: O(2^n) - 同じ部分問題を何度も計算する
# 空間計算量: O(n) - 再帰の深さ
def fibo(n)
  return n if n <= 1

  fibo(n - 1) + fibo(n - 2)
end

# 解法2: メモ化再帰
# 時間計算量: O(n) - 各 n を1回だけ計算する
# 空間計算量: O(n) - memo と再帰の深さ
def fibo(n, memo = {})
  return n if n <= 1
  return memo[n] if memo.key?(n)

  memo[n] = fibo(n - 1, memo) + fibo(n - 2, memo)
end

# 解法3: 反復（直前2項だけ保持）
# 時間計算量: O(n) - 2 から n まで1回ずつ更新する
# 空間計算量: O(1) - previous / current のみ使用
def fibo(n)
  return n if n <= 1
  previous, current = 0, 1
  (2..n).each do
    previous, current = current, previous + current
  end
  current
end

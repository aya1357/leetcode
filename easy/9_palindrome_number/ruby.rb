# 解法1: 数値を文字列に変換して反転・比較する
# @param {Integer} x
# @return {Boolean}
# 時間計算量: O(log n) - 数値を文字列に変換して反転・比較する
# 空間計算量: O(log n) - 文字列と反転した文字列を保持する
def is_palindrome(x)
  str = x.to_s
  str == str.reverse
end

# 解法2: 数値の約半分の桁数を処理する(最適化)
# 時間計算量: O(log n) - 数値の約半分の桁数を処理する
# 空間計算量: O(1) - 追加の文字列や配列を作成しない
def is_palindrome(x)
  # 負の数はマイナス記号があるため回文にならない
  return false if x.negative?
  # 末尾が0の数は、0自体を除いて回文にならない
  return false if x % 10 == 0 && x != 0

  # 数値の後半を反転して保存する変数
  reversed = 0
  # 元の数値が反転した数値以下になるまで繰り返す
  while x > reversed
    # xの末尾の数字を取り出し、reversedの末尾に追加する
    reversed = reversed * 10 + x % 10
    # xの末尾の数字を削除する
    x /= 10
  end
  # 偶数桁: 前半と反転した後半が一致すれば回文
  # 奇数桁: reversedの中央の数字を除いて一致すれば回文
  x == reversed || x == reversed / 10
end

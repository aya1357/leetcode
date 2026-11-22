# 解法1: t を走査しながら s のポインタを進める
# @param {String} s
# @param {String} t
# @return {Boolean}
# 時間計算量: O(n) - t を1回走査する
# 空間計算量: O(1) - ポインタ i のみ使用
# n: t の長さ
def is_subsequence(s, t)
  i = 0
  t.each_char do |char|
    i += 1 if s[i] == char
    return true if i == s.length
  end
  i == s.length
end

# 解法2: s が空なら早期 return（計算量は同じ）
# @param {String} s
# @param {String} t
# @return {Boolean}
# 時間計算量: O(n) - t を1回走査する
# 空間計算量: O(1) - ポインタ i のみ使用
# n: t の長さ
def is_subsequence(s, t)
  return true if s.empty?

  i = 0
  t.each_char do |char|
    i += 1 if s[i] == char
    return true if i == s.length
  end
  false
end

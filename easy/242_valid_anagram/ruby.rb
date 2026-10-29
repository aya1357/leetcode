# @param {String} s
# @param {String} t
# @return {Boolean}
# 時間計算量: O(n + m) - 両文字列を chars / tally で1回ずつ走査する
# 空間計算量: O(n + m) - chars の配列と出現回数 Hash（英小文字26種なら Hash 自体は O(1)）
# n, m: s / t の長さ
def is_anagram(s, t)
  s.chars.tally == t.chars.tally
end

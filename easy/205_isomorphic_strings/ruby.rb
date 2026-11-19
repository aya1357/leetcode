# @param {String} s
# @param {String} t
# @return {Boolean}
# 時間計算量: O(n) - 文字列を1回走査する。Hash の参照・更新は平均 O(1)
# 空間計算量: O(k) - 文字の対応表2つ（文字種が定数なら O(1)）
# n: 文字列の長さ / k: 登場する文字の種類数
def is_isomorphic(s, t)
  s_to_t = {}
  t_to_s = {}
  s.each_char.with_index do |char, i|
      return false if s_to_t.key?(char) && s_to_t[char] != t[i]
      return false if t_to_s.key?(t[i]) && t_to_s[t[i]] != char

      s_to_t[char] = t[i]
      t_to_s[t[i]] = char
  end
  true
end

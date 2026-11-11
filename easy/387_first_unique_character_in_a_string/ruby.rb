# @param {String} s
# @return {Integer}
# 時間計算量: O(n) - tally とインデックス走査でそれぞれ1回ずつ文字列を見る
# 空間計算量: O(1) - 出現回数 Hash（英小文字26種なら定数。一般にはユニーク文字数分）
def first_uniq_char(s)
  result = s.each_char.tally

  s.each_char.with_index do |char, i|
    return i if result[char] == 1
  end

  -1
end

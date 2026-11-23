# @param {String} s
# @return {String}
# 時間計算量: O(n) - 文字列を1回走査する
# 空間計算量: O(n) - 結果文字列 result（depth 自体は O(1)）
def remove_outer_parentheses(s)
  result = ''
  depth = 0
  s.each_char do |char|
      if char == '('
          result << char if depth > 0
          depth += 1
      else
          depth -= 1
          result << char if depth > 0
      end
  end
  result
end

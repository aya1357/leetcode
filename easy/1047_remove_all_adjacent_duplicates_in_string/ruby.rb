# @param {String} s
# @return {String}
# 時間計算量: O(n) - 各文字を最大1回 push / pop する
# 空間計算量: O(n) - スタック result と join 後の文字列
def remove_duplicates(s)
  result = []

  s.each_char do |char|
    if result.last == char
      result.pop
    else
      result << char
    end
  end

  result.join
end

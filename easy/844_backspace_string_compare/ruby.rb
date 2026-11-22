# 解法1: スタックで実際の文字列を組み立てて比較する
# @param {String} s
# @param {String} t
# @return {Boolean}
# 時間計算量: O(n + m) - 両文字列を1回ずつ走査する
# 空間計算量: O(n + m) - 組み立て用のスタック
# n, m: s / t の長さ
def backspace_compare(s, t)
  build(s) == build(t)
end

def build(str)
  stack = []

  str.each_char do |char|
    if char == '#'
      stack.pop
    else
      stack << char
    end
  end
  stack
end

# 解法2: 後ろから2ポインタで有効な文字だけ比較する
# @param {String} s
# @param {String} t
# @return {Boolean}
# 時間計算量: O(n + m) - 各文字を最大1回ずつ見る
# 空間計算量: O(1) - ポインタと skip のみ使用
# n, m: s / t の長さ
def backspace_compare(s, t)
  i = s.length - 1
  j = t.length - 1

  while i >= 0 || j >= 0
    i = next_valid_index(s, i)
    j = next_valid_index(t, j)
    return false if i >= 0 && j >= 0 && s[i] != t[j]
    return false if (i < 0) != (j < 0)

    i -= 1
    j -= 1
  end
  true
end

def next_valid_index(str, index)
  skip = 0
  while index >= 0
    if str[index] == '#'
      skip += 1
    elsif skip > 0
      skip -= 1
    else
      break
    end
    index -= 1
  end
  index
end

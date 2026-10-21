PAIRS = {
  ')' => '(',
  '}' => '{',
  ']' => '[',
}

# 解法1: key? で閉じ括弧か判定し、PAIRS を参照する
# @param {String} s
# @return {Boolean}
# 時間計算量: O(n) - 各文字を1回走査。Hash参照・push/pop は平均 O(1)
# 空間計算量: O(n) - 最悪すべて開き括弧のときスタックに最大 n 個
def is_valid(s)
  stack = []
  s.each_char do |char|
    if PAIRS.key?(char)
      return false if stack.pop != PAIRS[char]
    else
      stack << char
    end
  end
  stack.empty?
end

# 解法2: PAIRS[char] を1回だけ参照する（Hashの参照回数を減らす）
# @param {String} s
# @return {Boolean}
# 時間計算量: O(n) - 各文字を1回走査。Hash参照・push/pop は平均 O(1)
# 空間計算量: O(n) - 最悪すべて開き括弧のときスタックに最大 n 個
def is_valid(s)
  stack = []
  s.each_char do |char|
    opening = PAIRS[char]
    if opening
      return false if stack.pop != opening
    else
      stack << char
    end
  end
  stack.empty?
end

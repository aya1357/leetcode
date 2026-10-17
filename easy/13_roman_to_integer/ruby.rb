ROMANS = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000,
}.freeze

SUBTRACTIVE_PAIRS = {
    'V' => 'I',
    'X' => 'I',
    'L' => 'X',
    'C' => 'X',
    'D' => 'C',
    'M' => 'C',
}.freeze

# @param {String} s
# @return {Integer}
# 時間計算量: O(n) - 文字列を1回走査し、各文字に対してHashの検索・加算を行う
# 空間計算量: O(n) - s.charsで文字数に応じた配列を生成する
def roman_to_int(s)
    result = 0
    prev = ''
    s.chars do |char|
        result += ROMANS[char]
        result -= ROMANS[SUBTRACTIVE_PAIRS[char]] * 2 if prev == SUBTRACTIVE_PAIRS[char]
        prev = char
    end
    result
end

# 最適化したコード
# 時間計算量: O(n) - 文字列を1回走査する
# 空間計算量: O(1) - 固定サイズのHashと変数のみ使用する
def roman_to_int(s)
  result = 0
  prev = 0
  s.each_char do |char|
    current = ROMANS[char]
    result += current
    result -= prev * 2 if prev < current
    prev = current
  end
  result
end

# @param {String[]} strs
# @return {String}
# 時間計算量: O(n × m)
# 空間計算量: O(1)（出力文字列を含めると O(m)）
# n: 文字列の数
# m: 最初の文字列の長さ
def longest_common_prefix(strs)
  result = ''
  strs[0].each_char.with_index do |char, index|
    break if strs.any? { |str| str[index] != char }

    result << char
  end
  result
end

# @param {String[]} strs
# @return {String}
# 時間計算量: O(n × m)
# 空間計算量: O(1)（出力文字列を含めると O(m)）
# n: 文字列の数
# m: 最初の文字列の長さ
def longest_common_prefix(strs)
  first = strs[0]
  index = 0

  while index < first.length
    char = first[index]
    strs.each do |str|
      return first[0...index] if str[index] != char
    end
    index += 1
  end
  first
end

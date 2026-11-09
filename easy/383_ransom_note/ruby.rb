# 解法1: magazine の出現回数を tally し、ransom_note で減らす
# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
# 時間計算量: O(m + n) - magazine / ransom_note をそれぞれ1回走査する
# 空間計算量: O(m) - chars の配列と出現回数 Hash（英小文字26種なら Hash 自体は O(1)）
# m: magazine の長さ / n: ransom_note の長さ
def can_construct(ransom_note, magazine)
  hash = magazine.chars.tally
  ransom_note.each_char.each do |char|
    if hash[char] == 0 || hash[char].nil?
      return false
    else
      hash[char] -= 1
    end
  end
  true
end

# 解法2: fetch で書き方を整理した版（計算量は同じ）
# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
# 時間計算量: O(m + n) - magazine / ransom_note をそれぞれ1回走査する
# 空間計算量: O(m) - chars の配列と出現回数 Hash（英小文字26種なら Hash 自体は O(1)）
# m: magazine の長さ / n: ransom_note の長さ
def can_construct(ransom_note, magazine)
  counts = magazine.chars.tally

  ransom_note.each_char do |char|
    return false if counts.fetch(char, 0).zero?

    counts[char] -= 1
  end

  true
end

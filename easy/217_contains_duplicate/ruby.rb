# 解法1: uniq! で破壊的に重複削除し、戻り値で判定する（よくない書き方）
# @param {Integer[]} nums
# @return {Boolean}
# 時間計算量: O(n) - 各要素を1回ずつ見て一意化する（平均）
# 空間計算量: O(n) - 内部で出現済みを記録するハッシュを使う
# ※ 元配列を破壊するため非推奨。uniq! は重複がなければ nil を返す
def contains_duplicate(nums)
  nums.uniq! == nums
end

# 解法2: 非破壊の uniq と長さ比較
# @param {Integer[]} nums
# @return {Boolean}
# 時間計算量: O(n) - uniq で各要素を1回処理する（平均）
# 空間計算量: O(n) - 重複を除いた新しい配列を作る
def contains_duplicate(nums)
  nums.uniq.length != nums.length
end

# 解法3: Set で出現済みを記録しながら走査
# @param {Integer[]} nums
# @return {Boolean}
# 時間計算量: O(n) - 各要素に対する include? / add が平均 O(1)
# 空間計算量: O(n) - 最悪ですべての要素を Set に保持する
def contains_duplicate(nums)
  seen = Set.new

  nums.each do |num|
    return true if seen.include?(num)

    seen.add(num)
  end
  false
end

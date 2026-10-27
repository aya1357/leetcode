# 解法1: tally で出現回数を数え、1回だけの要素を返す
# @param {Integer[]} nums
# @return {Integer}
# 時間計算量: O(n) - tally と select で配列を走査する
# 空間計算量: O(n) - 出現回数を記録する Hash を作る
def single_number(nums)
  nums.tally.select { |key, value| value == 1 }.keys.first.to_i
end

# 解法2: XOR で畳み込む（同じ数は打ち消し合い、1つだけ残る）
# @param {Integer[]} nums
# @return {Integer}
# 時間計算量: O(n) - 各要素を1回 XOR する
# 空間計算量: O(1) - 累積結果のみ保持する
# 0 → 計算を始めるときの初期値
# :^ → XOR（^）で計算する
# reduce → 計算結果を次の計算に引き継ぐ
def single_number(nums)
  nums.reduce(0, :^)
end

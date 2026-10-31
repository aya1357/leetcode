# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
# 時間計算量: O(n) - 要素を先頭と末尾から入れ替えていく
# 空間計算量: O(1) - 破壊的に in-place で反転する（追加配列なし）
def reverse_string(s)
  s.reverse!
end

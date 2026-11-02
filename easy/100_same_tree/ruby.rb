# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
# 時間計算量: O(n) - 対応するノードを1組ずつ比較する
# 空間計算量: O(h) - 再帰の深さ（バランス木なら O(log n)、偏った木なら O(n)）
# n: ノード数 / h: 木の高さ
def is_same_tree(p, q)
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil?
  return false if p.val != q.val

  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end

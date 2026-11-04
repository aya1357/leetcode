# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
# 時間計算量: O(n) - 各ノードを最大1回ずつ訪れる
# 空間計算量: O(h) - 再帰の深さ（バランス木なら O(log n)、偏った木なら O(n)）
# n: ノード数 / h: 木の高さ
def min_depth(root)
  return 0 if root.nil?

  return 1 + min_depth(root.left) if root.right.nil?
  return 1 + min_depth(root.right) if root.left.nil?

  1 + [min_depth(root.left), min_depth(root.right)].min
end

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
# @return {TreeNode}
# 時間計算量: O(n) - 各ノードを1回ずつ訪れて左右を入れ替える
# 空間計算量: O(h) - 再帰の深さ（バランス木なら O(log n)、偏った木なら O(n)）
# n: ノード数 / h: 木の高さ
def invert_tree(root)
  return nil if root.nil?

  root.left, root.right = root.right, root.left
  invert_tree(root.left)
  invert_tree(root.right)

  root
end

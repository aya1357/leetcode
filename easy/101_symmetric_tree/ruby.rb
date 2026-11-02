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
# @return {Boolean}
# 時間計算量: O(n) - 各ノードを最大1回ずつ比較する
# 空間計算量: O(h) - 再帰の深さ（バランス木なら O(log n)、偏った木なら O(n)）
# n: ノード数 / h: 木の高さ
def is_symmetric(root)
  return true if root.nil?

  mirror?(root.left, root.right)
end

def mirror?(left, right)
  return true if left.nil? && right.nil?
  return false if left.nil? || right.nil?
  return false if left.val != right.val

  mirror?(left.left, right.right) && mirror?(left.right, right.left)
end

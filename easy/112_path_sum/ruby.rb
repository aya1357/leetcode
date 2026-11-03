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
# @param {Integer} target_sum
# @return {Boolean}
# 時間計算量: O(n) - 各ノードを最大1回ずつ訪れる
# 空間計算量: O(h) - 再帰の深さ（バランス木なら O(log n)、偏った木なら O(n)）
# n: ノード数 / h: 木の高さ
def has_path_sum(root, target_sum)
  return false if root.nil?

  target_sum -= root.val
  return target_sum == 0 if root.left.nil? && root.right.nil?

  has_path_sum(root.left, target_sum) || has_path_sum(root.right, target_sum)
end

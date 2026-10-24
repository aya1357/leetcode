# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
      @val = val
      @left = left
      @right = right
  end
end

# @param {TreeNode} root
# @return {Integer}
# 時間計算量: O(n) - 各ノードを1回ずつ訪れる
# 空間計算量: O(h) - 再帰の深さ（バランス木なら O(log n)、偏った木の場合 O(n)）になる
# n: ノード数 / h: 木の高さ
def max_depth(root)
  return 0 if root.nil?

  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)
  [left_depth, right_depth].max + 1
end

# @param {TreeNode} root
# @return {Integer}
# def max_depth(root)
#   return 0 if root.nil?

#   puts "============="
#   puts "root.val: #{root.val}"

#   left_depth = max_depth(root.left)
#   puts "root #{root.val} の left_depth: #{left_depth}"

#   right_depth = max_depth(root.right)
#   puts "root #{root.val} の right_depth: #{right_depth}"

#   depth = [left_depth, right_depth].max + 1
#   puts "root #{root.val} の返り値: #{depth}"

#   depth
# end

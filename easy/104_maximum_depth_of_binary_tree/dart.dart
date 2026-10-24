import 'dart:math';

// Definition for a binary tree node.
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int maxDepth(TreeNode? root) {
    if (root == null) return 0;

    final leftDepth = maxDepth(root.left);
    final rightDepth = maxDepth(root.right);
    return max(leftDepth, rightDepth) + 1;
  }
}

package easy.maximum_depth_of_binary_tree

// Definition for a binary tree node.
// val はKotlinのキーワードのため、バッククォートで囲んでプロパティ名にする
class TreeNode(var `val`: Int) {
    var left: TreeNode? = null
    var right: TreeNode? = null
}

class Solution {
    fun maxDepth(root: TreeNode?): Int {
        if (root == null) return 0

        val leftDepth = maxDepth(root.left)
        val rightDepth = maxDepth(root.right)
        return maxOf(leftDepth, rightDepth) + 1
    }
}

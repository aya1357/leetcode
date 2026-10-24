use std::cell::RefCell;
use std::rc::Rc;

// Definition for a binary tree node.
#[derive(Debug, PartialEq, Eq)]
pub struct TreeNode {
    pub val: i32,
    pub left: Option<Rc<RefCell<TreeNode>>>,
    pub right: Option<Rc<RefCell<TreeNode>>>,
}

impl TreeNode {
    #[inline]
    pub fn new(val: i32) -> Self {
        TreeNode {
            val,
            left: None,
            right: None,
        }
    }
}

pub struct Solution;

impl Solution {
    pub fn max_depth(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
        // Ruby の return 0 if root.nil? → let Some(node) = root else { return 0; };
        // let-else は None なら return し、Some なら中身を node に取り出す
        let Some(node) = root else { return 0; };
        // RefCell の中身を読むために borrow() する
        let node = node.borrow();

        // Rc の clone() は参照カウントを増やすだけで、木そのものはコピーしない
        let left_depth = Self::max_depth(node.left.clone());
        let right_depth = Self::max_depth(node.right.clone());
        left_depth.max(right_depth) + 1
    }
}

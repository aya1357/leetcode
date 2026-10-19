use std::collections::HashSet;

pub struct Solution;

impl Solution {
    // 引数を書き換えるため mut を付ける
    pub fn contains_duplicate(mut nums: Vec<i32>) -> bool {
        let length = nums.len();
        // Ruby の uniq! → sort() で並べ替えてから dedup() で連続する重複を除く
        // どちらも元のVecを書き換える。uniq! と違い、要素の順番は変わる
        nums.sort();
        nums.dedup();
        nums.len() != length
    }
}

pub struct Solution2;

impl Solution2 {
    pub fn contains_duplicate(nums: Vec<i32>) -> bool {
        // Ruby の nums.uniq.length → nums.iter().collect::<HashSet<_>>().len()
        nums.iter().collect::<HashSet<_>>().len() != nums.len()
    }
}

pub struct Solution3;

impl Solution3 {
    pub fn contains_duplicate(nums: Vec<i32>) -> bool {
        // Ruby の Set.new → HashSet::new()
        let mut seen = HashSet::new();
        for num in nums {
            // Ruby の seen.include?(num) → seen.contains(&num)
            if seen.contains(&num) {
                return true;
            }
            // Ruby の seen.add(num) → seen.insert(num)
            seen.insert(num);
        }
        false
    }
}

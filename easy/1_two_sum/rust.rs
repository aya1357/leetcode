use std::collections::HashMap;

pub struct Solution;

// 一般的な整数 → i32
// 大きな整数 → i64
// 配列のインデックス・要素数 → usize
// 負数を扱わない整数 → u32 や u64（用途に応じて）
impl Solution {
    pub fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
        // 数値をキー、インデックスを値として保存するHashMapを作成
        let mut seen: HashMap<i32, i32> = HashMap::new();
        // 配列を走査し、インデックス(i)と数値(num)を取得
        for (i, &num) in nums.iter().enumerate() {
            // targetから現在の数値を引き、必要な数値を求める
            let diff = target - num;
            // 必要な数値がHashMapに存在すれば、そのインデックスを取得
            // &j は、参照（&）から値を取り出して、変数 j に代入
            if let Some(&j) = seen.get(&diff) {
                // 2つのインデックスを配列で返す
                return vec![j, i as i32];
            }
            // 現在の数値とインデックスをHashMapに保存
            seen.insert(num, i as i32);
        }
        // 条件に一致する組み合わせがなければ空の配列を返す
        vec![]
    }
}

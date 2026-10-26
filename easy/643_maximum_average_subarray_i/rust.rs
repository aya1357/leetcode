pub struct Solution;

impl Solution {
    pub fn find_max_average(nums: Vec<i32>, k: i32) -> f64 {
        // 添字には usize を使うため、k を変換しておく
        let k = k as usize;
        // Ruby の nums[0, k].sum → nums[..k].iter().sum::<i32>()
        let mut sum = nums[..k].iter().sum::<i32>();
        let mut max_sum = sum;
        // Ruby の (k...nums.length).each → for i in k..nums.len()
        // .. は Ruby の ...（終わりを含まない範囲）と同じ
        for i in k..nums.len() {
            sum += nums[i] - nums[i - k];
            max_sum = max_sum.max(sum);
        }
        // Ruby の max_sum.to_f / k → max_sum as f64 / k as f64（Rustは型の違う数値同士を計算できない）
        max_sum as f64 / k as f64
    }
}

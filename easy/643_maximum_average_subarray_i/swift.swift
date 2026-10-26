class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        // Ruby の nums[0, k].sum → nums[0..<k].reduce(0, +)
        // ..< は Ruby の ...（終わりを含まない範囲）と同じ
        var sum = nums[0..<k].reduce(0, +)
        var maxSum = sum
        for i in k..<nums.count {
            sum += nums[i] - nums[i - k]
            maxSum = max(maxSum, sum)
        }
        // Ruby の max_sum.to_f / k → Double(maxSum) / Double(k)（Swiftは型の違う数値同士を計算できない）
        return Double(maxSum) / Double(k)
    }
}

package average

var _ = findMaxAverage

func findMaxAverage(nums []int, k int) float64 {
	// Ruby の nums[0, k].sum → Goには sum がないため、forで足す
	sum := 0
	for _, num := range nums[:k] {
		sum += num
	}
	maxSum := sum
	for i := k; i < len(nums); i++ {
		sum += nums[i] - nums[i-k]
		maxSum = max(maxSum, sum)
	}
	// Ruby の max_sum.to_f / k → float64(maxSum) / float64(k)（Goは型の違う数値同士を計算できない）
	return float64(maxSum) / float64(k)
}

package twosum

var _ = twoSum

func twoSum(nums []int, target int) []int {
	// :=：新しい変数を宣言して、値を代入する
	// =：すでに宣言されている変数に値を代入する
	// rubyのseen = {}と同じ
	// seen := map[int]int{}の書き方もできる
	seen := make(map[int]int)
	for i, num := range nums {
		diff := target - num
		if j, ok := seen[diff]; ok {
			return []int{j, i}
		}

		seen[num] = i
	}
	return nil
}

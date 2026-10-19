package duplicate

import "slices"

var (
	_ = containsDuplicate
	_ = containsDuplicate2
	_ = containsDuplicate3
)

func containsDuplicate(nums []int) bool {
	length := len(nums)
	// Ruby の uniq! → Goにはないため、slices.Sort で並べ替えてから slices.Compact で連続する重複を除く
	// どちらも元のスライスを書き換える。uniq! と違い、要素の順番は変わる
	slices.Sort(nums)
	return len(slices.Compact(nums)) != length
}

func containsDuplicate2(nums []int) bool {
	// Ruby の uniq → Goにはないため、mapのキーにして重複を除く
	// struct{} はメモリを使わない空の型。値は使わずキーだけ使うときに使う
	unique := make(map[int]struct{})
	for _, num := range nums {
		unique[num] = struct{}{}
	}
	return len(unique) != len(nums)
}

func containsDuplicate3(nums []int) bool {
	// Ruby の Set.new → GoにはSetがないため、map[int]struct{} で代用する
	seen := make(map[int]struct{})
	for _, num := range nums {
		// Ruby の seen.include?(num) → _, ok := seen[num]（キーがあれば ok が true）
		if _, ok := seen[num]; ok {
			return true
		}
		// Ruby の seen.add(num) → seen[num] = struct{}{}
		seen[num] = struct{}{}
	}
	return false
}

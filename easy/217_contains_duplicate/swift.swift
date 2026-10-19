class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        // Ruby の uniq! → Swiftにはないため、sort() で並べ替えてから隣同士を比べる
        // Swiftの配列は値型のため、var にコピーして書き換えても呼び出し元の配列は変わらない
        var nums = nums
        nums.sort()
        // 制約上 nums は1要素以上あるので、1..<nums.count が空でも範囲エラーにならない
        for i in 1..<nums.count {
            if nums[i] == nums[i - 1] { return true }
        }
        return false
    }
}

class Solution2 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
}

class Solution3 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        // Ruby の Set.new → Set<Int>()
        var seen = Set<Int>()
        for num in nums {
            // Ruby の seen.include?(num) → seen.contains(num)
            if seen.contains(num) { return true }
            // Ruby の seen.add(num) → seen.insert(num)
            seen.insert(num)
        }
        return false
    }
}

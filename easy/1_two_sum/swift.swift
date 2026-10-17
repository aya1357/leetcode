class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // [:] 空のDictionaryを作成する
        var seen: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            let diff = target - num
            if let j = seen[diff] {
                return [j, i]
            }

            seen[num] = i
        }
        return []
    }
}

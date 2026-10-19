package easy.contains_duplicate

class Solution {
    fun containsDuplicate(nums: IntArray): Boolean {
        // Ruby の uniq! → IntArray は要素数を変えられないため、sort() で元の配列を並べ替え、隣同士を比べる
        nums.sort()
        for (i in 1 until nums.size) {
            if (nums[i] == nums[i - 1]) return true
        }
        return false
    }
}

class Solution2 {
    fun containsDuplicate(nums: IntArray): Boolean {
        return nums.distinct().size != nums.size
    }
}

class Solution3 {
    fun containsDuplicate(nums: IntArray): Boolean {
        val seen = HashSet<Int>()
        for (num in nums) {
            if (seen.contains(num)) return true
            seen.add(num)
        }
        return false
    }
}

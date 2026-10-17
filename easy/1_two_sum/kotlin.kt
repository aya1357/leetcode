package easy.two_sum

class Solution {
    fun twoSum(nums: IntArray, target: Int): IntArray {
        val seen = HashMap<Int, Int>()
        for ((i, num) in nums.withIndex()) {
            val diff = target - num
            val j = seen[diff]
            if (j != null) {
                return intArrayOf(j, i)
            }

            seen[num] = i
        }
        return intArrayOf()
    }
}

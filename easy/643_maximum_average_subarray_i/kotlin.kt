package easy.maximum_averate_subarray_i

class Solution {
    fun findMaxAverage(nums: IntArray, k: Int): Double {
        // Ruby の nums[0, k].sum → nums.sliceArray(0 until k).sum()
        var sum = nums.sliceArray(0 until k).sum()
        var maxSum = sum
        // Ruby の (k...nums.length).each → for (i in k until nums.size)
        // until は Ruby の ...（終わりを含まない範囲）と同じ
        for (i in k until nums.size) {
            sum += nums[i] - nums[i - k]
            maxSum = maxOf(maxSum, sum)
        }
        return maxSum.toDouble() / k
    }
}

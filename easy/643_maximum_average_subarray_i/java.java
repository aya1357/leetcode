import java.util.Arrays;

class Solution {
    public double findMaxAverage(int[] nums, int k) {
        int sum = Arrays.stream(nums, 0, k).sum();
        int maxSum = sum;
        for (int i = k; i < nums.length; i++) {
            sum += nums[i] - nums[i - k];
            maxSum = Math.max(maxSum, sum);
        }
        // Ruby の max_sum.to_f / k → (double) maxSum / k
        // int 同士の / は小数点以下が切り捨てられるため、先に double にキャストする
        return (double) maxSum / k;
    }
}

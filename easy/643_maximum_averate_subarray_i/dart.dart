class Solution {
  double findMaxAverage(List<int> nums, int k) {
    var sum = nums.sublist(0, k).reduce((a, b) => a + b);
    var maxSum = sum;
    for (var i = k; i < nums.length; i++) {
      sum += nums[i] - nums[i - k];
      maxSum = max(maxSum, sum);
    }
    return maxSum / k;
  }
}

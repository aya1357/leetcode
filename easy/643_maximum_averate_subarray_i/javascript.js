var findMaxAverage = function(nums, k) {
    let sum = nums.slice(0, k).reduce((a, b) => a + b, 0);
    let maxSum = sum;
    for (let i = k; i < nums.length; i++) {
        sum += nums[i] - nums[i - k];
        maxSum = Math.max(maxSum, sum);
    }
    // Ruby の max_sum.to_f / k → maxSum / k（JSの数値は整数と小数の区別がない）
    return maxSum / k;
}

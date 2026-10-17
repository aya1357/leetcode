class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final seen = <int, int>{};
    for (var i = 0; i < nums.length; i++) {
      final diff = target - nums[i];
      final j = seen[diff];
      if (j != null) {
        return [j, i];
      }

      seen[nums[i]] = i;
    }
    return [];
  }
}

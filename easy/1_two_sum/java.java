import java.util.HashMap;
import java.util.Map;

class Solution {
    public int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> seen = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int diff = target - nums[i];
            if (seen.containsKey(diff)) {
                // get(キー) で、そのキーに対応する値を取得
                return new int[] { seen.get(diff), i };
            }

            // put(キー, 値) という形式で保存
            seen.put(nums[i], i);
        }
        return new int[0];
    }
}

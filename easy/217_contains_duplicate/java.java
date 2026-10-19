import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

class Solution {
    public boolean containsDuplicate(int[] nums) {
        // Ruby の uniq! → Javaの配列は要素数を変えられないため、Arrays.sort で元の配列を並べ替え、隣同士を比べる
        Arrays.sort(nums);
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] == nums[i - 1]) return true;
        }
        return false;
    }
}

class Solution2 {
    public boolean containsDuplicate(int[] nums) {
        // Ruby の nums.uniq.length → Arrays.stream(nums).distinct().count()
        // count() は long を返すが、int の nums.length とそのまま比較できる
        return Arrays.stream(nums).distinct().count() != nums.length;
    }
}

class Solution3 {
    public boolean containsDuplicate(int[] nums) {
        // Ruby の Set.new → new HashSet<>()
        // int のようなプリミティブ型はジェネリクスに使えないため、Integer を指定する
        Set<Integer> seen = new HashSet<>();
        for (int num : nums) {
            // Ruby の seen.include?(num) → seen.contains(num)
            if (seen.contains(num)) return true;
            // Ruby の seen.add(num) → seen.add(num)
            seen.add(num);
        }
        return false;
    }
}

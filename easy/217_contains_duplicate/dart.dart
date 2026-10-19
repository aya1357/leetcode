class Solution {
  bool containsDuplicate(List<int> nums) {
    final length = nums.length;
    // Ruby の uniq! → Dartにはないため、toSet() で重複を除いた内容で元のリストを書き換える
    // toSet() は uniq と同じく、最初に出てきた順番を保つ
    final unique = nums.toSet();
    nums
      ..clear()
      ..addAll(unique);
    return nums.length != length;
  }
}

class Solution2 {
  bool containsDuplicate(List<int> nums) {
    return nums.toSet().length != nums.length;
  }
}

class Solution3 {
  bool containsDuplicate(List<int> nums) {
    // Ruby の Set.new → <int>{}（{} だけだと Map になる）
    final seen = <int>{};
    for (final num in nums) {
      if (seen.contains(num)) return true;
      seen.add(num);
    }
    return false;
  }
}

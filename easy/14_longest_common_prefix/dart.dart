class Solution {
  String longestCommonPrefix(List<String> strs) {
    final result = StringBuffer();
    final first = strs[0];
    for (var index = 0; index < first.length; index++) {
      final char = first[index];
      if (strs.any((str) => index >= str.length || str[index] != char)) break;
      result.write(char);
    }
    return result.toString();
  }
}

class Solution2 {
  String longestCommonPrefix(List<String> strs) {
    final first = strs[0];
    var index = 0;
    while (index < first.length) {
      final char = first[index];
      for (final str in strs) {
        if (index >= str.length || str[index] != char) return first.substring(0, index);
      }
      index++;
    }
    return first;
  }
}

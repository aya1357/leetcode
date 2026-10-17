class Solution {
  // Dart：定数は lowerCamelCase
  static const Map<String, int> romans = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
  };

  int romanToInt(String s) {
    var result = 0;
    var prev = 0;
    for (var i = 0; i < s.length; i++) {
      final current = romans[s[i]]!;
      result += current;
      if (prev < current) result -= prev * 2;
      prev = current;
    }
    return result;
  }
}

class Solution {
  bool isPalindrome(int x) {
    final str = x.toString();
    final reversed = str.split('').reversed.join('');
    return str == reversed;
  }
}

class Solution2 {
  bool isPalindrome(int x) {
    if(x < 0) return false;
    if(x % 10 == 0 && x != 0) return false;

    int reversed = 0;
    while(x > reversed) {
      reversed = reversed * 10 + x % 10;
      x ~/= 10;
    }

    return x == reversed || x == reversed ~/ 10;
  }
}

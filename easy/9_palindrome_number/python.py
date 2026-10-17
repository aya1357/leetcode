class Solution:
    def isPalindrome(self, x: int) -> bool:
        s = str(x)
        # [::-1] は文字列を逆順にする
        return s == s[::-1]

class Solution2:
    def isPalindrome(self, x: int) -> bool:
        if x < 0: return False;
        if x % 10 == 0 and x != 0: return False;
        reversed = 0;
        while x > reversed:
            reversed = reversed * 10 + x % 10;
            x = x // 10;
        return x == reversed or x == reversed // 10;

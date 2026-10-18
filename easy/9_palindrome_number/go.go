package palindrome

import "strconv"

var (
	_ = isPalindrome
	_ = isPalindrome2
)

// Go言語でint型の整数を10進数の文字列（string型）に変換する関数
func isPalindrome(x int) bool {
	str := strconv.Itoa(x)

	// 左右の文字を比較
	for i := 0; i < len(str)/2; i++ {
		// 左右の文字が異なる場合は回文ではない
		if str[i] != str[len(str)-i-1] {
			return false
		}
	}
	return true
}

func isPalindrome2(x int) bool {
	if x < 0 { return false }
	if x % 10 == 0 && x != 0 { return false }

	reversed := 0
	for x > reversed {
		reversed = reversed * 10 + x % 10
		x /= 10
	}
	return x == reversed || x == reversed / 10
}

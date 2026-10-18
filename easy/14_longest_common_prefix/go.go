package prefix

import (
	"slices"
	"strings"
)

var (
	_ = longestCommonPrefix
	_ = longestCommonPrefix2
)

func longestCommonPrefix(strs []string) string {
	var result strings.Builder
	first := strs[0]
	for index := 0; index < len(first); index++ {
		char := first[index]
		// slices.ContainsFunc は Ruby の any? と同じ
		// 範囲外の添字はpanicになるため、長さを先に確認する
		if slices.ContainsFunc(strs, func(str string) bool {
			return index >= len(str) || str[index] != char
		}) {
			break
		}
		// 英数字は1バイトなのでWriteByteで追加できる
		result.WriteByte(char)
	}
	return result.String()
}

func longestCommonPrefix2(strs []string) string {
	first := strs[0]
	index := 0
	for index < len(first) {
		char := first[index]
		for _, str := range strs {
			if index >= len(str) || str[index] != char {
				return first[:index]
			}
		}
		index++
	}
	return first
}

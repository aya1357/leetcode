package roman

var _ = romanToInt

func romanToInt(s string) int {
	// ローマ数字は I、V、X など、すべてASCII文字なので map[byte]int が適切
	// Goの const は数値・文字列・真偽値などの定数式に使える、Mapには使えない。
	romans := map[byte]int{
		'I': 1,
		'V': 5,
		'X': 10,
		'L': 50,
		'C': 100,
		'D': 500,
		'M': 1000,
	}

	result := 0
	prev := 0
	for i := 0; i < len(s); i++ {
		current := romans[s[i]]
		result += current
		if prev < current { result -= prev * 2 }
		prev = current
	}
	return result
}

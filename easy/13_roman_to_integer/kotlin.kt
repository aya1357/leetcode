package easy.roman_to_integer

class Solution {
    private val romans = mapOf(
        'I' to 1,
        'V' to 5,
        'X' to 10,
        'L' to 50,
        'C' to 100,
        'D' to 500,
        'M' to 1000,
    )
    fun romanToInt(s: String): Int {
        var result = 0
        var prev = 0
        for (char in s) {
            // null安全演算子。!!でnullでないことを保証する。実際に null だった場合は NullPointerException が発生する。
            val current = romans[char]!!
            result += current
            if (prev < current) result -= prev * 2
            prev = current
        }
        return result
    }
}

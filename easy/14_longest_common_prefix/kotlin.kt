package easy.longest_common_prefix

class Solution {
    fun longestCommonPrefix(strs: Array<String>): String {
        val result = StringBuilder()
        // withIndex は Ruby の each_char.with_index と同じく (添字, 文字) を返す
        for ((index, char) in strs[0].withIndex()) {
            // it はラムダ式の引数が1つのときの暗黙の名前。範囲外の添字は例外になるため、長さを先に確認する
            if (strs.any { index >= it.length || it[index] != char }) break
            result.append(char)
        }
        return result.toString()
    }
}

class Solution2 {
    fun longestCommonPrefix(strs: Array<String>): String {
        val first = strs[0]
        var index = 0
        while (index < first.length) {
            val char = first[index]
            for (str in strs) {
                if (index >= str.length || str[index] != char) return first.substring(0, index)
            }
            index++
        }
        return first
    }
}

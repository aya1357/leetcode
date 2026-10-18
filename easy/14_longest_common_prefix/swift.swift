class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        // SwiftのStringは整数の添字でアクセスできないため、文字の配列に変換しておく
        let chars = strs.map { Array($0) }
        var result = ""
        for (index, char) in chars[0].enumerated() {
            // contains(where:) は Ruby の any? と同じ。範囲外の添字はクラッシュするため、長さを先に確認する
            if chars.contains(where: { index >= $0.count || $0[index] != char }) {
                break
            }
            result.append(char)
        }
        return result
    }
}

class Solution2 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let chars = strs.map { Array($0) }
        let first = chars[0]
        var index = 0
        while index < first.count {
            let char = first[index]
            for str in chars {
                if index >= str.count || str[index] != char {
                    return String(first[0..<index])
                }
            }
            index += 1
        }
        return strs[0]
    }
}

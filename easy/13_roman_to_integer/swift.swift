class Solution {
    func romanToInt(_ s: String) -> Int {
        let romans: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000,
        ]
        var result = 0
        var prev = 0
        for char in s {
            // 辞書の添字は Int?。制約上キーは必ず存在するので ! で取り出してIntに変換
            let current = romans[char]!
            result += current
            if prev < current {
                result -= prev * 2
            }
            prev = current
        }
        return result
    }
}

/*
 * 【Swiftの基本】
 *
 * ・let : 再代入できない定数
 * ・var : 再代入できる変数
 * ・Int : 整数型
 * ・Bool : 真偽値型（true / false）
 * ・String(x) : 整数を文字列に変換する
 * ・String.reversed() : 文字を逆順に取り出すコレクションを返す
 * ・String(s.reversed()) : 反転した文字列をStringに変換する
 * ・文字列の内容は == で比較できる
 * ・整数同士の / は整数除算になる
 * ・文末のセミコロン（;）は基本的に不要
 * ・ifやwhileの条件に()は不要
 * ・ifやwhileの処理には{}が必要
 *
 * 【引数と参照】
 *
 * ・Swiftの引数は基本的に値渡し
 * ・関数の引数は再代入できない
 * ・Int、String、Array、Dictionary、Structは値型
 * ・Classは参照型
 * ・値型はCopy-on-Writeによって効率的にコピーされる場合がある
 *
 * 【文字列操作】
 *
 * ・String(x) : 数値を文字列に変換する
 * ・reversed() : 要素を逆順に取り出す
 * ・String(s.reversed()) : 反転した文字列を生成する
 *
 * 【整数除算】
 *
 * ・整数同士の / は整数除算になる
 * ・123 / 10 = 12
 * ・-123 / 10 = -12（0方向への切り捨て）
 */

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let s = String(x)
        return s == String(s.reversed())
    }
}

class Solution2 {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        if x % 10 == 0 && x != 0 { return false }

        var num = x
        var reversed = 0
        while num > reversed {
            reversed = reversed * 10 + num % 10
            num /= 10
        }

        return num == reversed || num == reversed / 10
    }
}

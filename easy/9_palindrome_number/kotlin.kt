/*
 * 【Kotlinの基本】
 *
 * val : 再代入できない変数（Javaのfinalに相当）
 * var : 再代入できる変数
 *
 * ・関数の引数は再代入できないため、値を更新する場合はvarにコピーする
 * ・整数同士の / は整数除算になる（例: 123 / 10 = 12）
 * ・String.reversed()で文字列を反転できる
 * ・Stringの内容は == で比較できる
 * ・文末のセミコロン（;）は基本的に不要
 *
 * 【引数と参照】
 *
 * ・Kotlinの引数はすべて値渡し
 * ・オブジェクトの場合、参照という値がコピーされる
 * ・同じオブジェクトを参照するため、状態変更は呼び出し元にも反映される
 * ・ローカル変数の参照先を変更しても、呼び出し元の参照には影響しない
 *
 * 【ListとMutableList】
 *
 * ・Listはread-onlyであり、immutableを保証しない
 * ・Listからは要素の追加・削除・変更ができない
 * ・MutableListからは要素の追加・削除・変更ができる
 * ・valで宣言したMutableListでも、要素の追加・削除は可能
 */
package easy.palindrome_number

class Solution {
    fun isPalindrome(x: Int): Boolean {
        val str = x.toString()
        return str == str.reversed()
    }
}

class Solution2 {
    fun isPalindrome(x: Int): Boolean {
        if(x < 0) return false;
        if(x % 10 == 0 && x != 0) return false;

        var num = x;
        var reversed = 0;
        while(num > reversed) {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }

        return num == reversed || num == reversed / 10;
    }
}

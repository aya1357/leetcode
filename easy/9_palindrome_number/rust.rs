pub struct Solution;

// 一般的な整数 → i32
// 大きな整数 → i64
// 配列のインデックス・要素数 → usize
// 負数を扱わない整数 → u32 や u64（用途に応じて）
impl Solution {
    pub fn isPalindrome(x: i32) -> bool {
        // 数値をキー、インデックスを値として保存するHashMapを作成
        let s = x.to_string();
        /*
         * 【Rustの文字列操作】
         *
         * ・chars()              : 文字列をchar単位で取り出すイテレータを返す
         * ・rev()                : イテレータの取り出し順序を逆にする
         * ・collect()            : イテレータの要素をまとめてコレクションを生成する
         * ・collect::<String>()  : 要素を結合してStringを生成する
         * ・collect::<Vec<char>>() : 要素をVec<char>にまとめる
         * ・::<型>               : turbofish構文。ジェネリック型を明示する
         *
         * ・chars()やrev()だけでは新しい文字列は作られない
         * ・collect()で初めて結果の文字列が生成される
         */
        /*
         * 12345
         *   ↓ to_string()
         * "12345"
         *   ↓ chars()
         * '1', '2', '3', '4', '5'
         *   ↓ rev()
         * '5', '4', '3', '2', '1'
         *   ↓ collect::<String>()
         * "54321"
         */
        let reversed = s.chars().rev().collect::<String>();
        return s == reversed;
    }
}

class Solution2 {
    pub fn isPalindrome(x: i32) -> bool {
        if x < 0 { return false; }
        if x % 10 == 0 && x != 0 { return false; }

        let mut reversed = 0;
        let mut num = x;
        while num > reversed {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        return num == reversed || num == reversed / 10;
    }
}

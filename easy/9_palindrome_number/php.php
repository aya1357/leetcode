<?php

class Solution {

    /**
     * @param int $x
     * @return bool
     */
    function isPalindrome($x) {
        /*
         * 【(string) と strval() の違い】
         *
         * ・(string) $x : キャストによって文字列に変換する
         * ・strval($x)  : 関数を使って文字列に変換する
         * ・どちらも同じ文字列を返す
         * ・通常の型変換では (string) の方がシンプルでおすすめ
         * ・strval() は array_map() などに関数として渡せる
         *
         * 【使用例】
         *
         * $str = (string) $x;                  // キャストによる型変換
         * $str = strval($x);                   // 関数による型変換
         *
         * $nums = [1, 2, 3];
         * $result = array_map('strval', $nums); // ["1", "2", "3"]
         */
        $str = strval($x);
        return $str === strrev($str);
    }
}

class Solution2 {
    /**
     * @param int $x
     * @return bool
     */
    function isPalindrome($x) {
        if($x < 0) return false;
        if($x % 10 == 0 && $x != 0) return false;

        $reversed = 0;
        while($x > $reversed) {
            $reversed = $reversed * 10 + $x % 10;
            $x = intdiv($x, 10);
        }

        return $x === $reversed || $x === intdiv($reversed, 10);
    }
}

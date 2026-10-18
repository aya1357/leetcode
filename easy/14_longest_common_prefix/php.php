<?php

class Solution {

    /**
     * @param string[] $strs
     * @return string
     */
    function longestCommonPrefix($strs) {
        $result = '';
        $first = $strs[0];
        $length = strlen($first);
        for ($i = 0; $i < $length; $i++) {
            $char = $first[$i];
            // PHP 8.4未満には Ruby の any? にあたる関数がないため、foreachで確認する
            foreach ($strs as $str) {
                // break 2 で、外側のforまでまとめて抜ける
                if ($i >= strlen($str) || $str[$i] !== $char) break 2;
            }
            $result .= $char;
        }
        return $result;
    }
}

class Solution2 {
    /**
     * @param string[] $strs
     * @return string
     */
    function longestCommonPrefix($strs) {
        $first = $strs[0];
        $index = 0;
        $length = strlen($first);
        while ($index < $length) {
            $char = $first[$index];
            foreach ($strs as $str) {
                if ($index >= strlen($str) || $str[$index] !== $char) return substr($first, 0, $index);
            }
            $index++;
        }
        return $first;
    }
}

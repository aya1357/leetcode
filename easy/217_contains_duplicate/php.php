<?php

class Solution {

    /**
     * @param int[] $nums
     * @return bool
     */
    function containsDuplicate($nums) {
        $count = count($nums);
        // PHPの配列は値渡しのため、ここで書き換えても呼び出し元の配列は変わらない
        $nums = array_unique($nums);
        return count($nums) !== $count;
    }
}

class Solution2 {
    /**
     * @param int[] $nums
     * @return bool
     */
    function containsDuplicate($nums) {
        return count(array_unique($nums)) !== count($nums);
    }
}

class Solution3 {
    /**
     * @param int[] $nums
     * @return bool
     */
    function containsDuplicate($nums) {
        $seen = [];
        foreach ($nums as $num) {
            if (isset($seen[$num])) return true;
            $seen[$num] = true;
        }
        return false;
    }
}
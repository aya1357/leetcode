<?php

class Solution {

    /**
     * @param int[] $nums
     * @param int $target
     * @return int[]
     */
    function twoSum($nums, $target) {
        $seen = [];
        foreach ($nums as $i => $num) {
            $diff = $target - $num;
            if (array_key_exists($diff, $seen))  return [$seen[$diff], $i];
            $seen[$num] = $i;
        }
        return [];
    }
}

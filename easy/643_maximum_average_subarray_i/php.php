<?php

class Solution {

    /**
     * @param int[] $nums
     * @param int $k
     * @return float
     */
    function findMaxAverage($nums, $k) {
        $sum = array_sum(array_slice($nums, 0, $k));
        $maxSum = $sum;
        $length = count($nums);
        for ($i = $k; $i < $length; $i++) {
            $sum += $nums[$i] - $nums[$i - $k];
            $maxSum = max($maxSum, $sum);
        }
        // Ruby の max_sum.to_f / k → (float) $maxSum / $k
        // PHPの / は割り切れると int を返すため、float にキャストしておく
        return (float) $maxSum / $k;
    }
}

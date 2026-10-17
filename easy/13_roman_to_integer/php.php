<?php

class Solution {
    private const ROMANS =[
        'I' => 1,
        'V' => 5,
        'X' => 10,
        'L' => 50,
        'C' => 100,
        'D' => 500,
        'M' => 1000,
    ];

    /**
     * @param string $s
     * @return int
     */
    public function romanToInt(string $s): int {
        $result = 0;
        $prev = 0;
        $length = strlen($s);
        for ($i = 0; $i < $length; $i++) {
            $current = self::ROMANS[$s[$i]];
            $result += $current;
            if ($prev < $current) $result -= $prev * 2;
            $prev = $current;
        }
        return $result;
    }
}

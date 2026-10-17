class Solution:
    def romanToInt(self, s: str) -> int:
        romans = {
            'I': 1,
            'V': 5,
            'X': 10,
            'L': 50,
            'C': 100,
            'D': 500,
            'M': 1000,
        }
        result = 0
        prev = 0
        for char in s:
            current = romans[char]
            result += current
            if prev < current:
                result -= prev * 2
            prev = current
        return result

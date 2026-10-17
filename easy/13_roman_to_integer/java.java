import java.util.Map;

class Solution {
    private static final Map<Character, Integer> ROMANS = Map.of(
        'I', 1,
        'V', 5,
        'X', 10,
        'L', 50,
        'C', 100,
        'D', 500,
        'M', 1000
    );

    public int romanToInt(String s) {
        int result = 0;
        int prev = 0;

        for (int i = 0; i < s.length(); i++) {
            int current = ROMANS.get(s.charAt(i));
            result += current;
            if (prev < current) result -= prev * 2;
            prev = current;
        }

        return result;
    }
}

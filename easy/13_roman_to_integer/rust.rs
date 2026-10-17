use std::collections::HashMap;
pub struct Solution;

impl Solution {
    pub fn roman_to_int(s: String) -> i32 {
        let romans = HashMap::from([
            ('I', 1),
            ('V', 5),
            ('X', 10),
            ('L', 50),
            ('C', 100),
            ('D', 500),
            ('M', 1000),
        ]);
        let mut result = 0;
        let mut prev = 0;
        for char in s.chars() {
            let current = romans[&char];
            result += current;
            if prev < current {
                result -= prev * 2;
            }
            prev = current;
        }
        result
    }
}

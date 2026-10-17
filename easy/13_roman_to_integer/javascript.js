const ROMANS = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
}

var romanToInt = function(s) {
    let result = 0;
    let prev = 0;
    for (let i = 0; i < s.length; i++) {
        let current = ROMANS[s[i]];
        result += current;
        if (prev < current) result -= prev * 2;
        prev = current;
    }
    return result;
}

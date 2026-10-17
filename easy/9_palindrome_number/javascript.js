var isPalindrome = function(x) {
    const str = x.toString();
    const reversed = str.split('').reverse().join('');
    return str === reversed;
}

var isPalindrome2 = function(x) {
    if(x < 0) return false;
    if(x % 10 == 0 && x != 0) return false;

    let reversed = 0;
    while(x > reversed) {
        reversed = reversed * 10 + x % 10;
        // Math.floor()：小数点以下を切り捨て、負の無限大方向に丸める
        // Math.trunc()：小数部分を取り除き、0方向に丸める
        x = Math.trunc(x / 10);
    }

    return x === reversed || x === Math.trunc(reversed / 10);
}

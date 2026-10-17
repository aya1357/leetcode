export function isPalindrome(x: number): boolean {
    const s = x.toString();
    return s === s.split('').reverse().join('');
}

export function isPalindrome2(x: number): boolean {
    if (x < 0) return false;
    if (x % 10 === 0 && x !== 0) return false;
    let reversed = 0;
    let num = x;
    while (num > reversed) {
        reversed = reversed * 10 + num % 10;
        num = Math.trunc(num / 10);
    }
    return num === reversed || num === Math.trunc(reversed / 10);
}

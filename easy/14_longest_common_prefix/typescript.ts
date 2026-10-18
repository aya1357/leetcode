export function longestCommonPrefix(strs: string[]): string {
    let result = '';
    for (const [index, char] of Array.from(strs[0]).entries()) {
        if (strs.some((str) => str[index] !== char)) break;
        result += char;
    }
    return result;
}

export function longestCommonPrefix2(strs: string[]): string {
    const first = strs[0];
    let index = 0;
    while (index < first.length) {
        const char = first[index];
        for (const str of strs) {
            if (str[index] !== char) return first.slice(0, index);
        }
        index++;
    }
    return first;
}

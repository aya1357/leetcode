var longestCommonPrefix = function(strs) {
    let result = '';
    // Array.from(文字列).entries() は Ruby の each_char.with_index と同じく [添字, 文字] を返す
    for (const [index, char] of Array.from(strs[0]).entries()) {
        if (strs.some((str) => str[index] !== char)) break;
        result += char;
    }
    return result;
}

var longestCommonPrefix2 = function(strs) {
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

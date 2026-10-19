var containsDuplicate = function(nums) {
    const length = nums.length;
    // Ruby の uniq! → JSにはないため、Setで重複を除いた内容で元の配列を書き換える
    // Set は uniq と同じく、最初に出てきた順番を保つ
    const unique = new Set(nums);
    nums.length = 0;
    for (const num of unique) nums.push(num);
    return nums.length !== length;
}

var containsDuplicate2 = function(nums) {
    return new Set(nums).size !== nums.length;
}

var containsDuplicate3 = function(nums) {
    const seen = new Set();
    for (const num of nums) {
        if (seen.has(num)) return true;
        seen.add(num);
    }
    return false;
}

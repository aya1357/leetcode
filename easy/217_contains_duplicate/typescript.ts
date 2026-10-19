export function containsDuplicate(nums: number[]): boolean {
    const length = nums.length;
    const unique = new Set(nums);
    nums.length = 0;
    for (const num of unique) nums.push(num);
    return nums.length !== length;
}

export function containsDuplicate2(nums: number[]): boolean {
    return new Set(nums).size !== nums.length;
}

export function containsDuplicate3(nums: number[]): boolean {
    const seen = new Set<number>();
    for (const num of nums) {
        if (seen.has(num)) return true;
        seen.add(num);
    }
    return false;
}

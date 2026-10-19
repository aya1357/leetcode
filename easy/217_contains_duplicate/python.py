class Solution:
    def containsDuplicate(self, nums: list[int]) -> bool:
        length = len(nums)
        # dict.fromkeys(nums) は、リストの要素をキーにした辞書を作成する
        # 辞書は同じキーを持てないため、重複が削除される
        # 最初に出現した順番は維持される
        # => {3: None, 1: None, 2: None}
        # nums[:] は、元のリストのすべての要素を表す
        # スライス代入により、元のリスト自体の中身を書き換える
        # Rubyの nums.uniq! に近い処理
        nums[:] = dict.fromkeys(nums)
        return len(nums) != length

class Solution2:
    def containsDuplicate(self, nums: list[int]) -> bool:
        return len(set(nums)) != len(nums)

class Solution3:
    def containsDuplicate(self, nums: list[int]) -> bool:
        seen = set()
        for num in nums:
            if num in seen:
                return True
            seen.add(num)
        return False

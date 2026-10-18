class Solution:
    def longestCommonPrefix(self, strs: list[str]) -> str:
        result = ''
        # enumerate は Ruby の each_char.with_index と同じく (添字, 文字) を返す
        for index, char in enumerate(strs[0]):
            # Rubyと違い範囲外の添字はIndexErrorになるため、長さを先に確認する
            if any(index >= len(s) or s[index] != char for s in strs):
                break
            result += char
        return result

class Solution2:
    def longestCommonPrefix(self, strs: list[str]) -> str:
        first = strs[0]
        index = 0
        while index < len(first):
            char = first[index]
            for s in strs:
                if index >= len(s) or s[index] != char:
                    return first[:index]
            index += 1
        return first

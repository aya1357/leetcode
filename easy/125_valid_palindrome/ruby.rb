# 時間計算量: O(n)
# 空間計算量: O(n) ※scanで新しい配列を生成するため
def is_palindrome(s)
  strs = s.scan(/[a-zA-Z0-9]/)
  left = 0
  right = strs.length - 1

  while left < right
      return false if !strs[left].casecmp?(strs[right])

      left += 1
      right -= 1
  end
  true
end

# 時間計算量: O(n)
# 空間計算量: O(1)
def is_palindrome(s)
  left = 0
  right = s.length - 1

  while left < right
    if !s[left].match(/[a-zA-Z0-9]/)
      left += 1
      next
    end

    if !s[right].match(/[a-zA-Z0-9]/)
      right -= 1
      next
    end

    return false if !s[left].casecmp?(s[right])

    left += 1
    right -= 1
  end

  true
end

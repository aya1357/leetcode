# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
      @val = val
      @next = _next
  end
end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
# 時間計算量: O(n + m) - 両リストの各ノードを最大1回ずつ辿る
# 空間計算量: O(1) - dummy / current のみ。既存ノードを繋ぎ替えるだけで新規ノードは作らない
# n, m: それぞれのリストの長さ
def merge_two_lists(list1, list2)
  dummy = ListNode.new
  current = dummy
  while list1 && list2
      if list1.val <= list2.val
          current.next = list1
          list1 = list1.next
      else
          current.next = list2
          list2 = list2.next
      end
      current = current.next
  end
  current.next = list1 || list2
  dummy.next
end

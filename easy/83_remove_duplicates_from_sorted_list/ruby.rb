# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end

# 解法1: 配列にユニークな値を集める（※戻り値が配列で ListNode ではない）
# @param {ListNode} head
# @return {ListNode}
# 時間計算量: O(n) - リストを1回走査する
# 空間計算量: O(n) - ユニークな値を格納する配列を作る
def delete_duplicates(head)
  current = head
  result = []
  while current
    result << current.val if result.last != current.val
    current = current.next
  end
  result
end

# 解法2: ポインタで重複ノードをスキップする（in-place）
# @param {ListNode} head
# @return {ListNode}
# 時間計算量: O(n) - 各ノードを最大1回ずつ見る
# 空間計算量: O(1) - current のみ使用。既存ノードを繋ぎ替えるだけ
def delete_duplicates(head)
  current = head

  while current && current.next
    if current.val == current.next.val
      current.next = current.next.next
    else
      current = current.next
    end
  end

  head
end

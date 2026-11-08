# @param {String[]} operations
# @return {Integer}
# 時間計算量: O(n) - 各操作を1回処理する（sum も O(n)）
# 空間計算量: O(n) - スコアを積む配列 result
def cal_points(operations)
  result = []
  operations.each do |operation|
      case operation
      when '+'
          result << result.last + result[-2]
      when 'D'
          result << result.last * 2
      when 'C'
          result.pop
      else
          result << operation.to_i
      end
  end
  result.sum
end

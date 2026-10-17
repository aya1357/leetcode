/*
 * 【StringとStringBuilderの違い】
 *
 * 特徴           String                  StringBuilder
 * ------------------------------------------------------------
 * 文字列の変更   不可                    可能
 * 文字列の追加   +、+=                   append()
 * 文字列の反転   直接できない            reverse()
 * 文字列の削除   新しい文字列を作成      delete()
 * 主な用途       通常の文字列操作        文字列を何度も変更する処理
 *
 *
 * 【StringBuilderとStringBufferの違い】
 *
 * 特徴             StringBuilder          StringBuffer
 * ------------------------------------------------------------
 * 文字列の変更     可能                   可能
 * スレッドセーフ   いいえ                 メソッド単位で同期される
 * 処理速度         一般的に速い           同期処理の負荷がある
 * 主な用途         通常の文字列操作       同期が必要な処理
 *
 * 【使い分け】
 * String        : 文字列を変更する必要がない場合
 * StringBuilder : 文字列の追加・変更・削除を繰り返す場合
 * StringBuffer  : 複数スレッドから共有し、同期が必要な場合
 */
class Solution {
    public boolean isPalindrome(int x) {
        String str = String.valueOf(x);
        return str.equals(new StringBuilder(str).reverse().toString());
    }
}

class Solution2 {
    public boolean isPalindrome(int x) {
        if(x < 0) return false;
        if(x % 10 == 0 && x != 0) return false;

        int reversed = 0;
        while(x > reversed) {
            reversed = reversed * 10 + x % 10;
            x /= 10;
        }

        return x == reversed || x == reversed / 10;
    }
}

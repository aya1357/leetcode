import java.util.Arrays;

class Solution {
    public String longestCommonPrefix(String[] strs) {
        StringBuilder result = new StringBuilder();
        String first = strs[0];
        for (int i = 0; i < first.length(); i++) {
            // ラムダ式の中では再代入される変数(i)を使えないため、再代入しない変数にコピーする
            int index = i;
            char c = first.charAt(index);
            // anyMatch は Ruby の any? と同じ。範囲外の添字は例外になるため、長さを先に確認する
            // 配列（Array）：要素数が固定。シンプルで、プリミティブ型も扱える。
            // List（ArrayList）：要素の追加・削除ができる。Rubyの配列に近い。
            // Streamの取得結果の違い
            // Arrays.stream(strs).map(str -> str.charAt(index)).toArray()
            // → Object[]：要素をObject型の配列として取得
            //
            // Arrays.stream(strs).map(str -> str.charAt(index)).toArray(Character[]::new)
            // → Character[]：要素をCharacter型の配列として取得
            //
            // Arrays.stream(strs).map(str -> str.charAt(index)).toList()
            // → List<Character>：要素をCharacter型のListとして取得
            //
            // ※ toArray() はデフォルトで Object[] を返す
            // ※ toArray(Character[]::new) は配列の型を指定している
            // ※ toList() で取得したListは変更不可（add・remove・set不可）
            // ※ charAt() はchar型を返すが、map()ではCharacter型に自動変換される
            if (Arrays.stream(strs).anyMatch(str -> index >= str.length() || str.charAt(index) != c)) break;
            result.append(c);
        }
        return result.toString();
    }
}

class Solution2 {
    public String longestCommonPrefix(String[] strs) {
        String first = strs[0];
        int index = 0;
        while (index < first.length()) {
            char c = first.charAt(index);
            for (String str : strs) {
                // substring(開始, 終了) は終了の位置を含まない（Rubyの first[0...index] と同じ）
                if (index >= str.length() || str.charAt(index) != c) return first.substring(0, index);
            }
            index++;
        }
        return first;
    }
}

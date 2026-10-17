/*
 * Map と Record の違い
 *
 * 比較項目        Map                         Record
 * ------------------------------------------------------------------
 * データ構造      JavaScriptのMap             JavaScriptのオブジェクト
 * キーの型        任意の型                    string / number / symbol
 * 値の取得        .get(key)                   [key]
 * 値の追加        .set(key, value)            [key] = value
 * 存在確認        .has(key)                   Object.hasOwn(obj, key)
 * 要素数          .size                       Object.keys(obj).length
 * 追加・削除      頻繁な変更に向いている           用途による
 *
 * 使い分け
 * - Record：固定の対応表、設定値、キーを型で管理したい場合
 * - Map：動的な追加・削除、オブジェクトをキーにする場合
 *
 * ※ Record は TypeScript の型で、実体は通常のオブジェクト。
 * ※ Map.get() は undefined を返す可能性がある。
 * ※ Record の添字アクセス(nums[0] や romans['I'] のように、[] で値を取得する操作)も設定によっては undefined を考慮する必要がある。
 */
export function romanToInt(s: string): number {
    const romans: Record<string, number> = {
        I: 1,
        V: 5,
        X: 10,
        L: 50,
        C: 100,
        D: 500,
        M: 1000,
    };
    let result = 0;
    let prev = 0;
    for (const char of s) {
        const current = romans[char];
        result += current;
        if (prev < current) result -= prev * 2;
        prev = current;
    }
    return result;
}

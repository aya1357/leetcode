pub struct Solution;

impl Solution {
    pub fn longest_common_prefix(strs: Vec<String>) -> String {
        let mut result = String::new();
        // Rustの文字列は整数の添字でアクセスできないため、as_bytes()でbyte列として扱う
        for (index, &char) in strs[0].as_bytes().iter().enumerate() {
            // get(添字) は範囲外ならNoneを返すので、Rubyのnilと同じように比較できる
            if strs.iter().any(|str| str.as_bytes().get(index) != Some(&char)) {
                break;
            }
            // byte(u8) を文字(char)に変換して追加する
            result.push(char as char);
        }
        result
    }
}

pub struct Solution2;

impl Solution2 {
    pub fn longest_common_prefix(strs: Vec<String>) -> String {
        let first = &strs[0];
        let mut index = 0;
        while index < first.len() {
            let char = first.as_bytes()[index];
            for str in &strs {
                if str.as_bytes().get(index) != Some(&char) {
                    return first[..index].to_string();
                }
            }
            index += 1;
        }
        first.clone()
    }
}

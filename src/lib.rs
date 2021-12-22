pub fn naive_search_equality(haystack: &[u8], needle: &[u8]) -> Option<usize> {
    if needle.is_empty() {
        return Some(0usize);
    }

    haystack.windows(needle.len()).position(|candidate| candidate == needle)
}

pub fn naive_search_manual(haystack: &[u8], needle: &[u8]) -> Option<usize> {
    if needle.is_empty() {
        return Some(0usize);
    }

    haystack.windows(needle.len()).position(|candidate| {
        for i in 0..candidate.len() {
            if needle[i] != candidate[i] {
                return false;
            }
        }

        return true;
    })
}
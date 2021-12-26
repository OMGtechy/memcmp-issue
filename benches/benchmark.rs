#[macro_use]
extern crate bencher;

use bencher::Bencher;
use memcmp_issue::{naive_search_equality, naive_search_manual};

const TEST_HAYSTACK: &[u8] = b"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab";
const TEST_NEEDLE_SHORT: &[u8] = b"ab";
const TEST_NEEDLE_LONG: &[u8] = b"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab";

fn bench_equality_short_match(bencher: &mut Bencher) {
    bencher.iter(||
        naive_search_equality(TEST_HAYSTACK, TEST_NEEDLE_SHORT)
    );
}

fn bench_equality_long_match(bencher: &mut Bencher) {
    bencher.iter(||
        naive_search_equality(TEST_HAYSTACK, TEST_NEEDLE_LONG)
    );
}

fn bench_manual_short_match(bencher: &mut Bencher) {
    bencher.iter(||
        naive_search_manual(TEST_HAYSTACK, TEST_NEEDLE_SHORT)
    );
}

fn bench_manual_long_match(bencher: &mut Bencher) {
    bencher.iter(||
        naive_search_manual(TEST_HAYSTACK, TEST_NEEDLE_LONG)
    );
}

benchmark_group!(bencher, bench_equality_short_match, bench_equality_long_match, bench_manual_short_match, bench_manual_long_match);
benchmark_main!(bencher);
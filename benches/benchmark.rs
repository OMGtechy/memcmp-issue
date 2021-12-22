#[macro_use]
extern crate bencher;

use bencher::Bencher;
use memcmp_issue::{naive_search_equality, naive_search_manual};

const TEST_HAYSTACK: &[u8] = b"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab";
const TEST_NEEDLE: &[u8] = b"ab";

fn bench_equality(bencher: &mut Bencher) {
    bencher.iter(||
        naive_search_equality(TEST_HAYSTACK, TEST_NEEDLE)
    );
}

fn bench_manual(bencher: &mut Bencher) {
    bencher.iter(||
        naive_search_manual(TEST_HAYSTACK, TEST_NEEDLE)
    );
}

benchmark_group!(bencher, bench_equality, bench_manual);
benchmark_main!(bencher);
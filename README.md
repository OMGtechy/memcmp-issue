# memcmp-issue
This exists to help show an issue with Rust slice equality performance.

Benchmark results were generated with `cargo bench`.

ASM was generated using `cargo asm --no-color memcmp_issue::naive_search_equality` and `cargo asm --no-color memcmp_issue::naive_search_manual`.

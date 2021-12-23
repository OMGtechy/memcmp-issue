#include <cstddef>
#include <cstring>
#include <optional>
#include <string>
#include <string_view>

#include <benchmark/benchmark.h>

std::optional<std::size_t> cpp_memcmp(const std::string_view haystack, const std::string_view needle) {
    if (needle.empty()) {
        return 0;
    }

    if (needle.size() > haystack.size()) {
        return std::nullopt;
    }

    for (std::size_t i = 0; i < (haystack.size() - needle.size()); ++i) {
        if (std::memcmp(haystack.data() + i, needle.data(), needle.size()) == 0) {
            return i;
        }
    }

    return std::nullopt;
}

std::optional<std::size_t> cpp_manual(const std::string_view haystack, const std::string_view needle) {
    if (needle.empty()) {
        return 0;
    }

    if (needle.size() > haystack.size()) {
        return std::nullopt;
    }

    for (std::size_t i = 0; i < (haystack.size() - needle.size()); ++i) {
        bool matches = true;
        for (std::size_t j = 0; j < needle.size(); ++j) {
            if (haystack[i + j] != needle[j]) {
                matches = false;
                break;
            }
        }

        if (matches) {
            return i;
        }
    }

    return std::nullopt;
}

std::string haystack1 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab";
std::string needle1 = "ab";
std::string haystack2 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab";
std::string needle2 = "aaab";

static void BM_memcmp(benchmark::State& state) {
    benchmark::DoNotOptimize(haystack1);
    benchmark::DoNotOptimize(needle1);
    benchmark::DoNotOptimize(haystack2);
    benchmark::DoNotOptimize(needle2);

    const std::string_view haystack1_view = haystack1;
    const std::string_view needle1_view = needle1;

    const std::string_view haystack2_view = haystack2;
    const std::string_view needle2_view = needle2;

    for (auto _ : state) {
        benchmark::DoNotOptimize(cpp_memcmp(haystack1_view, needle1_view));
        benchmark::DoNotOptimize(cpp_memcmp(haystack2_view, needle2_view));
    }
}

BENCHMARK(BM_memcmp);

static void BM_manual(benchmark::State& state) {
    benchmark::DoNotOptimize(haystack1);
    benchmark::DoNotOptimize(needle1);
    benchmark::DoNotOptimize(haystack2);
    benchmark::DoNotOptimize(needle2);

    const std::string_view haystack1_view = haystack1;
    const std::string_view needle1_view = needle1;

    const std::string_view haystack2_view = haystack2;
    const std::string_view needle2_view = needle2;

    for (auto _ : state) {
        benchmark::DoNotOptimize(cpp_manual(haystack1_view, needle1_view));
        benchmark::DoNotOptimize(cpp_manual(haystack2_view, needle2_view));
    }
}

BENCHMARK(BM_manual);

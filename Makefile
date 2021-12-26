CPPFLAGS=-O3 -I../deps/benchmark/include -std=c++17 -L../build/benchmark/src -lbenchmark -lbenchmark_main -lpthread

all: rust clangpp gpp

googlebenchmark:
	mkdir -p build/benchmark
	cd build/benchmark && cmake -DCMAKE_BUILD_TYPE=Release -DBENCHMARK_ENABLE_TESTING=OFF ../../deps/benchmark && cmake --build .

gpp: googlebenchmark 
	cd build && g++ ../cpp-example.cpp $(CPPFLAGS) -o cpp_example_gpp
	g++ --version > gpp-version.txt
	build/cpp_example_gpp | tee gpp.txt

clangpp: googlebenchmark
	cd build && clang++ ../cpp-example.cpp $(CPPFLAGS) -o cpp_example_clangpp
	clang++ --version > clangpp-version.txt
	build/cpp_example_clangpp | tee clangpp.txt

cpp: gpp clangpp

rust:
	cargo bench > bench.txt
	cargo asm memcmp_issue::naive_search_equality --no-color > equality.asm
	cargo asm memcmp_issue::naive_search_manual --no-color > manual.asm
	rustc --version --verbose > rustc.txt

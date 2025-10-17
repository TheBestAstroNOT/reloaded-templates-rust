# Performance Benchmarking & Profiling

While Rust provides excellent performance out of the box, measuring and optimizing that performance requires proper tooling and setup.

The template provides the essential building blocks for benchmarking and profiling with [Criterion](https://github.com/bheisler/criterion.rs).

!!! info
    Benchmarking is optional during project generation. Enable it by selecting "Include Benchmark Configuration" when prompted.

## Quick Start
Run your first benchmark with a single command:

```bash
cargo bench
```

![Benchmark CLI Output](../assets/benchmark-cli.avif)
/// caption
Example CLI output when running benchmarks
///

This executes all benchmarks and generates detailed HTML reports in `target/criterion/report/index.html`.

![Benchmark Report](../assets/benchmark-report.avif)
/// caption
Example generated HTML report
///

Open the file in your web browser or right-click → "Show Preview" in VSCode.

## Running Benchmarks
Below are some useful additional benchmark commands:

```bash
# Run a specific benchmark
cargo bench "fib 20"

# Run a specific benchmark function
cargo bench "can_decompress_file_Model.bin"

# Run all benchmarks in a group
cargo bench "File Compression"

# Run all benchmarks beginning with a prefix
cargo bench "compress_"

# Run benchmarks with native CPU optimizations (for benchmarking specialized algorithms)
RUSTFLAGS="-C target-cpu=native" cargo bench
```

## Understanding Benchmark Code

### File Structure

```
benches/
├── main.rs              # [mandatory] Main benchmark entry point
├── util.rs              # [example] Utility functions for loading test data
├── compress.rs          # [example] Compression benchmarks
├── decompress.rs        # [example] Decompression benchmarks
└── gen_pgo_data.rs      # [example] PGO data generation
```

### Main Benchmark File

The `main.rs` file serves as the entry point for all benchmarks:

```rust
// Import individual benchmark modules
mod compress;
mod decompress;
mod gen_pgo_data;
mod util;

// Import required items
use compress::bench_compress_file;
use criterion::{criterion_group, criterion_main, Criterion};
use decompress::bench_decompress;
#[cfg(feature = "pgo")]
use gen_pgo_data::generate_pgo_data;

fn criterion_benchmark(c: &mut Criterion) {
    // Regular benchmarks - excluded from PGO
    #[cfg(not(feature = "pgo"))]
    {
        bench_decompress(c);
        bench_compress_file(c);
    }

    // PGO data generation - only runs during PGO builds
    #[cfg(feature = "pgo")]
    {
        generate_pgo_data();
    }
}

criterion_group! {
    name = benches;
    config = Criterion::default();
    targets = criterion_benchmark
}

criterion_main!(benches);
```

Add additional modules using `mod` at the top of the file, just like in regular Rust programs.

### Adding Benchmarks

Create individual benchmark functions in separate modules. Here's an example of a well-structured benchmark:

```rust
use crate::util::{get_compressed_file_path, load_sample_file};
use criterion::{Criterion, Throughput};
use prs_rs::decomp::{prs_calculate_decompressed_size, prs_decompress_unsafe};

pub fn bench_decompress(c: &mut Criterion) {
    let file_names = vec!["Model.bin", "ObjectLayout.bin", "WorstCase.bin"];
    let mut group = c.benchmark_group("File Decompression");

    for file_name in file_names {
        let compressed = load_sample_file(get_compressed_file_path(file_name));
        let decompressed_len = unsafe { prs_calculate_decompressed_size(compressed.as_slice()) };
        let mut decompressed = vec![0_u8; decompressed_len];
        group.throughput(Throughput::Bytes(decompressed_len as u64));
        group.bench_function(format!("can_decompress_file_{file_name}"), |b| {
            b.iter(|| unsafe {
                prs_decompress_unsafe(compressed.as_slice(), decompressed.as_mut_slice())
            })
        });
    }

    group.finish();
}
```

Best practices for adding benchmarks:

- **Use benchmark groups** - Organize related benchmarks together
- **Set throughput metrics** - Use throughput setting when appropriate
- **Test multiple scenarios** - Benchmark with different input sizes/types when appropriate
- **Only benchmark code in iter block** - Load test data outside the iteration to avoid measuring setup time

![Benchmark Comparison](../assets/benchmark-violin-plot.avif)
/// caption
Violin plot generated from the "File Decompression" benchmark group, comparing two files with the same size but different content
///

!!! tip
    Violin plots compare different data (same size) or different implementations.
    
    For code that processes external data like decompression, ensure same data size for fair comparisons.

??? info "Profile-Guided Optimization (PGO)"
    Sometimes benchmarks are used during the build process to collect performance data that helps the compiler optimize your code. You can exclude benchmarks from this process using conditional compilation:
    
    ```rust
    #[cfg(not(feature = "pgo"))]
    fn benchmark_excluded_from_pgo() {
        // Benchmark code here
    }
    ```

## Integration with Existing Projects
Add benchmarking to existing Rust projects by copying the template configuration:

- [templates/library/benches/my_benchmark/main.rs](https://github.com/Reloaded-Project/reloaded-templates-rust/blob/main/templates/library/benches/my_benchmark/main.rs) - Example benchmark with best practices
- [templates/library/Cargo.toml](https://github.com/Reloaded-Project/reloaded-templates-rust/blob/main/templates/library/Cargo.toml) - Benchmark dependencies and configuration

Add these dependencies to your `Cargo.toml`:

```toml
[dev-dependencies]
criterion = "0.5.1"
```

And this benchmark configuration:

```toml
[[bench]]
name = "my_benchmark"
harness = false
```
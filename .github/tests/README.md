# Template Testing Suite

Automated testing for cargo-generate templates. Validates that templates generate correct projects and builds succeed.

## Quick Start

```bash
python3 .github/tests/run_tests.py
```

This automatically:
1. Installs cargo-generate if needed
2. Creates a Python virtual environment
3. Installs dependencies
4. Runs all 6 test configurations

## What Gets Tested

| Configuration | Description                                      |
| ------------- | ------------------------------------------------ |
| `defaults`    | Default configuration with most features enabled |
| `all-on`      | All features enabled (comprehensive test)        |
| `all-off`     | Minimal features (fastest test)                  |
| `c-bindings`  | Tests C# bindings with C libraries               |
| `pgo-enabled` | Tests Profile-Guided Optimization                |
| `big-endian`  | Tests big-endian support                         |

Each test:
- Generates a project from the template
- Validates generated files and structure
- Runs `cargo check` to ensure the project compiles
- Verifies documentation builds (if enabled)

## Prerequisites

- **Python 3.8+** (https://www.python.org/downloads/)
- **Rust & Cargo** (https://rustup.rs/)

Everything else is auto-installed by the test runner.

## Options

```bash
# Skip integration tests (setup only)
python3 .github/tests/run_tests.py --skip-integration

# Verbose output
python3 .github/tests/run_tests.py --verbose
```

## How It Works

1. **Setup Phase**: Creates virtual environment and installs dependencies
2. **Test Phase**: Runs all 6 configurations sequentially
3. **Validation**: Each configuration generates a project, validates structure, and runs cargo check
4. **Summary**: Reports pass/fail for each configuration with timing

## Test Files

- **`run_tests.py`** - Cross-platform test runner (handles setup and execution)
- **`test_template.py`** - Integration test validator (generates and validates projects)
- **`requirements.txt`** - Python dependencies (auto-installed)

## CI Integration

GitHub Actions runs all 6 configurations in parallel on every pull request via `.github/workflows/test-templates.yml`.

## Troubleshooting

### Tests fail with "cargo check failed"

Ensure you have the latest Rust toolchain:
```bash
rustup update
```

### Virtual environment issues

Delete the venv and rerun:
```bash
rm -rf .github/tests/venv
python3 .github/tests/run_tests.py
```

### "Python not found" (Windows)

Try both `python` and `python3` commands. Ensure Python is in your PATH.

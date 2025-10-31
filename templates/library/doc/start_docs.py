#!/usr/bin/env python3
"""Helper script to start MkDocs development server."""
import subprocess
import sys
from pathlib import Path

def main():
    doc_dir = Path(__file__).parent
    try:
        subprocess.run(
            ["mkdocs", "serve"],
            cwd=doc_dir,
            check=True
        )
    except subprocess.CalledProcessError as e:
        print(f"Error running mkdocs: {e}", file=sys.stderr)
        sys.exit(1)
    except FileNotFoundError:
        print("mkdocs not found. Install with: pip install -r requirements.txt", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()

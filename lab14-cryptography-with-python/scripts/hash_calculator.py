#!/usr/bin/env python3
import hashlib
import sys

def calculate_sha256(filename):
    try:
        sha256 = hashlib.sha256()
        with open(filename, "rb") as f:
            while True:
                data = f.read(4096)
                if not data:
                    break
                sha256.update(data)
        return sha256.hexdigest()
    except FileNotFoundError:
        print(f"[ERROR] File not found: {filename}")
        return None
    except PermissionError:
        print(f"[ERROR] Permission denied: {filename}")
        return None

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 hash_calculator.py <filename>")
        sys.exit(1)

    filename = sys.argv[1]
    file_hash = calculate_sha256(filename)

    if file_hash:
        print(f"SHA256 Hash: {file_hash}")
        print(f"Hash Length: {len(file_hash)} characters")

if __name__ == "__main__":
    main()

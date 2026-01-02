#!/usr/bin/env python3
import hashlib
import json
import sys
import os
from datetime import datetime

class IntegrityChecker:
    def __init__(self, db_file="integrity.json"):
        self.db_file = db_file
        self.database = {}
        self.load_database()

    def load_database(self):
        try:
            with open(self.db_file, "r") as f:
                self.database = json.load(f)
        except FileNotFoundError:
            self.database = {}

    def save_database(self):
        with open(self.db_file, "w") as f:
            json.dump(self.database, f, indent=2)

    def calculate_hash(self, filepath):
        sha256 = hashlib.sha256()
        with open(filepath, "rb") as f:
            while True:
                data = f.read(4096)
                if not data:
                    break
                sha256.update(data)
        return sha256.hexdigest()

    def add_file(self, filepath):
        if not os.path.isfile(filepath):
            print("[ERROR] File does not exist.")
            return False

        file_hash = self.calculate_hash(filepath)
        stat = os.stat(filepath)

        self.database[filepath] = {
            "hash": file_hash,
            "timestamp": datetime.now().isoformat(),
            "size": stat.st_size
        }

        self.save_database()
        print(f"[OK] File added: {filepath}")
        return True

    def verify_file(self, filepath):
        if filepath not in self.database:
            print("[ERROR] File not tracked.")
            return False

        current_hash = self.calculate_hash(filepath)
        stored_hash = self.database[filepath]["hash"]

        if current_hash == stored_hash:
            print("[OK] Integrity verified.")
            return True
        else:
            print("[WARNING] File modified!")
            return False

    def list_files(self):
        if not self.database:
            print("No files tracked.")
            return

        for path, info in self.database.items():
            print(f"File: {path}")
            print(f"  Hash: {info['hash']}")
            print(f"  Added: {info['timestamp']}")
            print(f"  Size: {info['size']} bytes")

def main():
    if len(sys.argv) < 2:
        print("Usage: add <file> | verify <file> | list")
        sys.exit(1)

    checker = IntegrityChecker()
    command = sys.argv[1]

    if command == "add" and len(sys.argv) == 3:
        checker.add_file(sys.argv[2])
    elif command == "verify" and len(sys.argv) == 3:
        checker.verify_file(sys.argv[2])
    elif command == "list":
        checker.list_files()
    else:
        print("Invalid command.")

if __name__ == "__main__":
    main()

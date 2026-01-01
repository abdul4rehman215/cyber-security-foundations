import os
import shutil

target_dir = "../temp_files"
extensions = (".log", ".tmp", ".bak", ".cache")

removed_files = 0
removed_dirs = 0

print("=== FOLDER CLEANUP AUTOMATION ===")
print(f"Target directory: {target_dir}")

for root, dirs, files in os.walk(target_dir, topdown=False):
    for file in files:
        if file.endswith(extensions):
            os.remove(os.path.join(root, file))
            removed_files += 1
    for dir in dirs:
        path = os.path.join(root, dir)
        if not os.listdir(path):
            shutil.rmtree(path)
            removed_dirs += 1

print("Cleanup completed!")
print(f"Files removed: {removed_files}")
print(f"Directories removed: {removed_dirs}")

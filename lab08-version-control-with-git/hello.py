#!/usr/bin/env python3
"""
A simple hello world program
"""

def main():
    print("Hello, Git World!")
    print("This is my first versioned program.")

def greet_user(name):
    """Greet a specific user"""
    print(f"Hello, {name}! Welcome to Git!")

def display_info():
    print("=" * 30)
    print("Project: My First Git Project")
    print("Version: 1.0")
    print("Learning: Git version control")
    print("=" * 30)

if __name__ == "__main__":
    main()
    greet_user("Student")
    display_info()

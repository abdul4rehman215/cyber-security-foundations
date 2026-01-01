def check_password(password):
    score = 0
    if len(password) >= 8:
        score += 2
    if any(char.isupper() for char in password):
        score += 2
    if any(char.islower() for char in password):
        score += 2
    if any(char.isdigit() for char in password):
        score += 2
    if any(char in "!@#$%^&*" for char in password):
        score += 3
    return score

passwords = ["123456", "password", "SuperSecure123!"]

print("TESTING MULTIPLE PASSWORDS")
print("=" * 60)

for pwd in passwords:
    strength = check_password(pwd)
    print(f"\nPassword: {pwd}")
    print(f"Strength Score: {strength}/11")

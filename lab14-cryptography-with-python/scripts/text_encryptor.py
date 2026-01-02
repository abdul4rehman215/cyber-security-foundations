#!/usr/bin/env python3
from cryptography.fernet import Fernet

class TextEncryptor:
    def __init__(self):
        self.key = None

    def generate_key(self):
        self.key = Fernet.generate_key()

    def save_key(self, filename="keys/secret.key"):
        with open(filename, "wb") as f:
            f.write(self.key)
        print("[OK] Key saved.")

    def load_key(self, filename="keys/secret.key"):
        with open(filename, "rb") as f:
            self.key = f.read()

    def encrypt_text(self, plaintext):
        f = Fernet(self.key)
        return f.encrypt(plaintext.encode())

    def decrypt_text(self, encrypted_text):
        f = Fernet(self.key)
        return f.decrypt(encrypted_text).decode()

def main():
    encryptor = TextEncryptor()
    encryptor.generate_key()
    encryptor.save_key()

    text = input("Enter text to encrypt: ")
    encrypted = encryptor.encrypt_text(text)
    print("Encrypted:", encrypted)

    decrypted = encryptor.decrypt_text(encrypted)
    print("Decrypted:", decrypted)

if __name__ == "__main__":
    main()

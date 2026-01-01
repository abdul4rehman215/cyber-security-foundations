import requests

print("=== Testing GET Request ===")
r = requests.get("https://httpbin.org/get")
print("Request successful!")
print("Origin IP:", r.json()["origin"])
print("User Agent:", r.json()["headers"]["User-Agent"])

print("\n=== Testing GitHub API ===")
gh = requests.get("https://api.github.com/users/octocat").json()
print("GitHub User:", gh["login"])
print("Public Repos:", gh["public_repos"])
print("Followers:", gh["followers"])

import requests

params = {"student": "cybersec_learner", "lab": "web_technologies"}
r = requests.get("https://httpbin.org/get", params=params)
print("=== Testing GET with Parameters ===")
print(r.json()["args"])

payload = {"name": "Cybersecurity Student", "skills": ["HTTP", "APIs", "Python"]}
r = requests.post("https://httpbin.org/post", json=payload)
print("\n=== Testing POST with JSON ===")
print(r.json()["json"])

form = {"username": "student123"}
r = requests.post("https://httpbin.org/post", data=form)
print("\n=== Testing POST with Form Data ===")
print(r.json()["form"])

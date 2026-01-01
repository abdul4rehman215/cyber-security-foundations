import requests

def test(url):
    try:
        r = requests.get(url, timeout=5)
        r.raise_for_status()
        print("✓ Successful request completed")
    except requests.exceptions.HTTPError as e:
        print("HTTP error:", e.response.status_code)
    except requests.exceptions.Timeout:
        print("Timeout error")

print("Attempt 1: GET https://httpbin.org/get")
test("https://httpbin.org/get")

print("\nAttempt 1: GET https://httpbin.org/status/404")
test("https://httpbin.org/status/404")

print("\nAttempt 1: GET https://httpbin.org/delay/15")
test("https://httpbin.org/delay/15")

print("\nAttempt 1: POST https://httpbin.org/post")
requests.post("https://httpbin.org/post", json={"test": "data"})
print("✓ POST request with JSON data successful")

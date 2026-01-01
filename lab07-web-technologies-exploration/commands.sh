#!/bin/bash

# Connectivity Check
ping -c 3 google.com

# Basic GET request
curl https://httpbin.org/get

# Verbose HTTP request
curl -v https://httpbin.org/get

# Save response to file
curl https://httpbin.org/get -o response.json

# GET with parameters
curl "https://httpbin.org/get?name=student&course=cybersecurity"
curl -G https://httpbin.org/get -d "name=student" -d "course=cybersecurity"

# GitHub API
curl https://api.github.com/users/octocat

# Headers inspection
curl -I https://httpbin.org/get
curl -H "User-Agent: CyberSecurity-Student" https://httpbin.org/headers

# POST requests
curl -X POST https://httpbin.org/post -d "username=student&password=lab123"
curl -X POST https://httpbin.org/post -H "Content-Type: application/json" \
-d '{"name":"John Doe","course":"cybersecurity"}'

# POST JSON from file
curl -X POST https://httpbin.org/post -H "Content-Type: application/json" -d @student_data.json

# Other HTTP methods
curl -X PUT https://httpbin.org/put -d "data=updated"
curl -X DELETE https://httpbin.org/delete
curl -X PATCH https://httpbin.org/patch -d '{"field":"value"}'

# Status codes
curl -w "%{http_code}\n" -o /dev/null https://httpbin.org/status/200
curl -w "%{http_code}\n" -o /dev/null https://httpbin.org/status/404
curl -w "%{http_code}\n" -o /dev/null https://httpbin.org/status/500

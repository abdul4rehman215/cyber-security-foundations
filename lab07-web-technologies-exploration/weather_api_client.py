import requests

url = "https://api.open-meteo.com/v1/forecast"
params = {
    "latitude": 40.7128,
    "longitude": -74.0060,
    "current_weather": True
}

r = requests.get(url, params=params).json()
weather = r["current_weather"]

print("=== Current Weather Information ===")
print(f"Temperature: {weather['temperature']}°C")
print(f"Wind Speed: {weather['windspeed']} km/h")
print("Timezone:", r["timezone"])

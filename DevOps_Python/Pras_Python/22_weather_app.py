import requests

API_KEY="9c19005f0a68a70276d6a9b6db67e753"
city_name=input('Enter the name of the city: ')
url = f"https://api.openweathermap.org/data/2.5/weather?q={city_name}&appid={API_KEY}"
response = requests.get(url)
print(response)

if response.status_code == 200:
    weather_data=response.json()
    weather_desc= weather_data['weather'][0]['description']
    temp=weather_data['main']['temp'] - 273.15
    print(f'weather in {city_name}: {round(temp,2)} *c with {weather_desc}')
else:
    print(f"City_name {city_name} not found")


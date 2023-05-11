# SRC Simple Weather Application for Windows

## Quick demonstration of the project

This project is just a simple Flutter (Dart) application that displays basic data about current weather.

Half way into the project I realised that I could simply use OPENMETEO's Geocoding API, which would actually make things easier.
Instead of Geocoding API, I used a package that returns longitude and latitude for the current searched location. After that I dynamically insert the longitude and latitude in the GET request... This made things a little harder, but I decided to keep it, since it works well.

I could make the UI look better, but I honestly didn't have enough time.

## Some of the packages used in the project:
- State Management - Provider package
- Animated search bar - anim_search_bar
- REST - http package
- Current geo location -   geolocator: ^9.0.2
- Location based on searched string - geocoder_buddy
- Chart displaying - fl_chart

![image](https://github.com/jakac13/weather_src/assets/113991942/734a2205-b672-4c5f-b186-9f65ae0896af)
![image](https://github.com/jakac13/weather_src/assets/113991942/143f3ebc-2146-4024-a980-0879d0235289)



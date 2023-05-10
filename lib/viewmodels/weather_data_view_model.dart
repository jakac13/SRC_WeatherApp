import 'package:flutter/material.dart';
import 'package:weather_src/models/weather_forecast_model.dart';

import '../models/lat_lng_model.dart';
import '../services/location_service.dart';
import '../services/weather_api_service.dart';

class WeatherDataViewModel extends ChangeNotifier {
  LatLng latLng = LatLng("0", "0");
  WeatherApiService api = WeatherApiService();
  LocationService location = LocationService();
  WeatherForecastModel? weatherData;
  bool loading = false;

  Future<void> getWeatherDataCurrentLocation() async {
    loading = true;

    try {
      final latLng = await location.currentLocation();
      final data = await api.fetchWeatherData(latLng);
      weatherData = WeatherForecastModel.fromJson(data);
      notifyListeners();
    } catch (e) {
      print(e);
      throw Exception();
    }
    loading = false;
    notifyListeners();
  }

  Future<void> getWeatherDataSearchedCity(String query) async {
    loading = true;
    notifyListeners();

    try {
      final latLng = await location.searchLocation(query);
      final data = await api.fetchWeatherData(latLng);
      weatherData = WeatherForecastModel.fromJson(data);
      notifyListeners();
    } catch (e) {
      throw Exception();
    }
    loading = false;
    notifyListeners();
  }
}

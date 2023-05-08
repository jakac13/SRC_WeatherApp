import 'package:weather_src/models/weather_forecast_model.dart';

import '../models/lat_lng_model.dart';
import '../services/location_service.dart';
import '../services/weather_api_service.dart';

class WeatherDataViewModel {
  LatLng latLng = LatLng("0", "0");
  WeatherApiService api = WeatherApiService();
  LocationService location = LocationService();

  Future<WeatherForecastModel> getWeatherDataCurrentLocation() async {
    try {
      final latLng = await location.currentLocation();
      final data = await api.fetchWeatherData(latLng);
      return WeatherForecastModel.fromJson(data);
    } catch (e) {
      throw Exception();
    }
  }

  Future<WeatherForecastModel> getWeatherDataSearchedCity(String query) async {
    try {
      final latLng = await location.searchLocation(query);
      final data = await api.fetchWeatherData(latLng);
      return WeatherForecastModel.fromJson(data);
    } catch (e) {
      print(e);

      throw Exception();
    }
  }
}

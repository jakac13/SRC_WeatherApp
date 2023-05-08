import '../models/lat_lng_model.dart';
import '../services/location_service.dart';
import '../services/weather_api_service.dart';

class WeatherDataViewModel {
  LatLng latLng = LatLng("0", "0");
  WeatherApiService api = WeatherApiService();
  LocationService location = LocationService();

  Future<Map<String, dynamic>> getWeatherDataCurrentLocation() async {
    try {
      final latLng = await location.currentLocation();
      final data = await api.fetchWeatherData(latLng);
      return data;
    } catch (e) {
      throw Exception();
    }
  }

  Future<Map<String, dynamic>> getWeatherDataSearchedCity(String query) async {
    try {
      final latLng = await location.searchLocation(query);
      final data = await api.fetchWeatherData(latLng);
      return data;
    } catch (e) {
      throw Exception();
    }
  }
}

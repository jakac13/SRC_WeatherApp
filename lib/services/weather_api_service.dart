import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_src/models/lat_lng_model.dart';

class WeatherApiService {
  Future<Map<String, dynamic>> fetchWeatherData(LatLng location) async {
    final String apiUrl =
        "https://api.open-meteo.com/v1/forecast?latitude=${location.latitude}&longitude=${location.longitude}&hourly=temperature_2m&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset&current_weather=true&past_days=1&timezone=Europe%2FBerlin";
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

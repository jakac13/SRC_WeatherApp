import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class WeatherApiService {
  Future<Map<String, dynamic>> fetchWeatherData() async {
    const String apiUrl =
        "https://api.open-meteo.com/v1/forecast?latitude=46.05&longitude=14.51&hourly=temperature_2m";
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

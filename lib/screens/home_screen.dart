import 'package:flutter/material.dart';
import 'package:weather_src/utils/app_styles.dart';
import 'package:weather_src/services/weather_api_service.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherApiService api = WeatherApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final response = await api.fetchWeatherData();
              Position position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high);
              print(position);
            },
            child: const Text('Data'),
          ),
        ],
      ),
    );
  }
}

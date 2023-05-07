import 'package:flutter/material.dart';
import 'package:weather_src/utils/app_styles.dart';
import 'package:weather_src/services/weather_api_service.dart';

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
              print(response);
              print(response);
            },
            child: const Text('Data'),
          ),
        ],
      ),
    );
  }
}

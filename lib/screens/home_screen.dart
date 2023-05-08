import 'package:flutter/material.dart';
import 'package:weather_src/models/weather_forecast_model.dart';
import 'package:weather_src/services/location_service.dart';
import 'package:weather_src/utils/app_styles.dart';
import 'package:weather_src/services/weather_api_service.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherForecastModel? weatherData;
  WeatherApiService api = WeatherApiService();
  LocationService location = LocationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              WeatherDataViewModel weatherViewModel = WeatherDataViewModel();
              final data =
                  await weatherViewModel.getWeatherDataSearchedCity("Miami");
              setState(() {
                weatherData = data;
              });
            },
            child: const Text('Get data'),
          ),
          Text(weatherData?.latitude.toString() ?? "Empty"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';
import 'package:intl/intl.dart';
import 'package:weather_src/services/weather_code_service.dart';

class CurrentWeatherComponent extends StatefulWidget {
  const CurrentWeatherComponent({super.key});

  @override
  State<CurrentWeatherComponent> createState() =>
      _CurrentWeatherComponentState();
}

class _CurrentWeatherComponentState extends State<CurrentWeatherComponent> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WeatherDataViewModel>(context);
    WeatherCodeService weatherImageProvider = WeatherCodeService();
    if (viewModel.loading) {
      return CircularProgressIndicator();
    }
    final currentWeather = viewModel.weatherData!.currentWeather;
    if (currentWeather == null) {
      return Text('No data');
    } else {
      return Container(
        width: double.infinity,
        child: Row(
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      currentWeather.temperature.toString(),
                    ),
                    Image.asset(
                      weatherImageProvider
                          .getWeatherImage(currentWeather.weathercode ?? 1)
                          .toString(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

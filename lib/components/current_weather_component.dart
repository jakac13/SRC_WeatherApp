import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_src/utils/app_styles.dart';
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
      return const CircularProgressIndicator();
    }
    final currentWeather = viewModel.weatherData!.currentWeather;
    DateTime date = DateTime.parse(currentWeather!.time ?? "");
    String formattedDate = DateFormat('EEEE').format(date);

    if (currentWeather == null) {
      return const Text('No data');
    } else {
      return Container(
        width: double.infinity,
        child: Row(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  color: AppTheme.blue,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        '${currentWeather.temperature.toString()} °C',
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(formattedDate,
                          style: const TextStyle(color: AppTheme.white)),
                      const SizedBox(
                        height: 20,
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
            ),
          ],
        ),
      );
    }
  }
}

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (viewModel.searchedCity == "")
                ? const Text(
                    "Weather for current location",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )
                : Wrap(
                    children: [
                      const Text(
                        "Weather for",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        viewModel.searchedCity,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      )
                    ],
                  ),
            const SizedBox(
              height: 10,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  color: AppTheme.blue,
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Currently",
                            style: TextStyle(color: AppTheme.white_darker),
                          ),
                          Text(
                            '${currentWeather.temperature.toString()} °C',
                            style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Wind speed",
                            style: TextStyle(color: AppTheme.white_darker),
                          ),
                          Text(
                            currentWeather.windspeed.toString(),
                            style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
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

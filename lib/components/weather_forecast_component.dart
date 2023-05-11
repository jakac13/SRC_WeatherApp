import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_src/utils/app_styles.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';
import 'package:intl/intl.dart';
import 'package:weather_src/services/weather_code_service.dart';

class WeatherForecastComponent extends StatefulWidget {
  const WeatherForecastComponent({super.key});

  @override
  State<WeatherForecastComponent> createState() =>
      _WeatherForecastComponentState();
}

class _WeatherForecastComponentState extends State<WeatherForecastComponent> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WeatherDataViewModel>(context);
    WeatherCodeService weatherImageProvider = WeatherCodeService();
    if (viewModel.loading) {
      return CircularProgressIndicator();
    }
    final dailyWeather = viewModel.weatherData?.daily;
    if (dailyWeather == null) {
      return Text('No data');
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weather 7 day forecast",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: List.generate(
                viewModel.weatherData!.daily!.time!.length,
                (index) {
                  DateTime date = DateTime.parse(dailyWeather.time![index]);
                  String formattedDate = DateFormat('EEEE').format(date);
                  return Container(
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                weatherImageProvider
                                    .getWeatherImage(
                                        dailyWeather.weathercode![index])
                                    .toString(),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formattedDate,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.thermostat,
                                        size: 20,
                                        color: Colors.blueAccent,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${dailyWeather.temperature2mMax![index]}  |',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.dark_light),
                                      ),
                                      Text(
                                        '  ${dailyWeather.temperature2mMin![index]}',
                                        style: const TextStyle(
                                          color: AppTheme.dark_light,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}

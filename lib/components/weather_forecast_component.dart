import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.weatherData!.daily!.time!.length,
            itemBuilder: (context, index) {
              DateTime date = DateTime.parse(dailyWeather.time![index]);
              String formattedDate = DateFormat('EEEE').format(date);
              return Container(
                width: 140,
                height: 50,
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          weatherImageProvider
                              .getWeatherImage(dailyWeather.weathercode![index])
                              .toString(),
                          height: 90,
                          width: 90,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(formattedDate),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.thermostat,
                              size: 20,
                            ),
                            Text(
                              '${dailyWeather.temperature2mMax![index]}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('${dailyWeather.temperature2mMin![index]}'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    }
  }
}

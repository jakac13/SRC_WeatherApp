import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';
import 'package:intl/intl.dart';

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

    if (viewModel.loading) {
      return CircularProgressIndicator();
    }
    final dailyWeather = viewModel.weatherData?.daily;
    if (dailyWeather == null) {
      return Text('No data');
    } else {
      return Flexible(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.weatherData!.daily!.time!.length,
            itemBuilder: (context, index) {
              DateTime date = DateTime.parse(dailyWeather.time![index]);
              String formattedDate = DateFormat('EEEE').format(date);
              return Container(
                width: 160,
                height: 50,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Text(formattedDate),
                      Text('Min: ${dailyWeather.temperature2mMin![index]}'),
                      Text('Max: ${dailyWeather.temperature2mMax![index]}'),
                      /* Text(
                        'Temperature Max: ${dailyWeather.temperature_2m_max[index]} '
                        'Min: ${dailyWeather.temperature_2m_min[index]}',
                      ), */
                    ],
                  ),
                ),
              );
            }),
      );
    }
  }
}

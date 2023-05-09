import 'package:flutter/material.dart';
import 'package:weather_src/components/line_chart_component.dart';
import 'package:weather_src/utils/app_styles.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherDataViewModel weatherViewModel = WeatherDataViewModel();

  @override
  void initState() {
    super.initState();
    Provider.of<WeatherDataViewModel>(context, listen: false)
        .getWeatherDataCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WeatherDataViewModel>(context);

    if (viewModel.loading == true) {
      return const CircularProgressIndicator();
    } else {
      return Scaffold(
        backgroundColor: AppTheme.dark,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  Provider.of<WeatherDataViewModel>(context, listen: false)
                      .getWeatherDataSearchedCity("");
                  setState(() {});
                },
                child: const Text('Get data'),
              ),
              Text(
                viewModel.weatherData?.currentWeather!.temperature.toString() ??
                    "No data",
                style: const TextStyle(color: AppTheme.white),
              ),
              AspectRatio(
                  aspectRatio: 4 / 1,
                  child: LineChartComponent(
                    WeatherForecastModel: viewModel.weatherData,
                  )),
            ],
          ),
        ),
      );
    }
  }
}

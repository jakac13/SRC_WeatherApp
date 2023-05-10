import 'package:flutter/material.dart';
import 'package:weather_src/components/line_chart_component.dart';
import 'package:weather_src/components/search_component.dart';
import 'package:weather_src/components/weather_forecast_component.dart';
import 'package:weather_src/utils/app_styles.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';
import 'package:provider/provider.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

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

    return Scaffold(
      backgroundColor: AppTheme.bright,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SearchComponent(),
            Text(
              viewModel.weatherData?.currentWeather!.temperature.toString() ??
                  "No data",
              style: const TextStyle(color: AppTheme.dark),
            ),
            /* !viewModel.loading
                ? AspectRatio(
                    aspectRatio: 4 / 1,
                    child: LineChartComponent(
                      WeatherForecastModel: viewModel.weatherData,
                    ))
                : const CircularProgressIndicator(), */
            SizedBox(height: 250, child: WeatherForecastComponent())
          ],
        ),
      ),
    );
  }
}

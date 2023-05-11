import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:weather_src/models/weather_forecast_model.dart';
import 'package:weather_src/utils/app_styles.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';
import 'dart:math';

class LineChartComponent extends StatefulWidget {
  const LineChartComponent({super.key});

  @override
  State<LineChartComponent> createState() => _LineChartComponentState();
}

class _LineChartComponentState extends State<LineChartComponent> {
  List<double> convertDatesToHours(List<String> timeList) {
    List<double> hourList = [];

    DateTime firstDateTime = DateTime.parse(timeList[0]);

    for (String time in timeList) {
      DateTime currentDateTime = DateTime.parse(time);
      Duration difference = currentDateTime.difference(firstDateTime);
      hourList.add(difference.inHours.toDouble());
    }
    return hourList.sublist(0, 24);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WeatherDataViewModel>(context);
    List<double> hourList =
        convertDatesToHours(viewModel.weatherData!.hourly!.time!.toList());
    List<double> fake = [2, 0];
    List<double> temperatureList =
        viewModel.weatherData!.hourly!.temperature2m ?? fake;
    temperatureList = temperatureList.sublist(0, 24);
    double tempMin = temperatureList.reduce(min);
    double tempMax = temperatureList.reduce(max);
    tempMin = tempMin.ceilToDouble();
    tempMax = tempMax.ceilToDouble();
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(),
              borderData: FlBorderData(
                border: const Border(
                  bottom: BorderSide(width: 1, color: AppTheme.white_darker),
                  left: BorderSide(width: 1, color: AppTheme.white_darker),
                ),
              ),
              minY: tempMin - 5,
              maxY: tempMax + 5,
              lineBarsData: [
                LineChartBarData(
                    spots: List<FlSpot>.generate(
                      24,
                      (index) => FlSpot(
                          hourList[index],
                          viewModel.weatherData!.hourly!.temperature2m!
                              .sublist(0, 24)[index]),
                    ),
                    isCurved: false,
                    barWidth: 3),
              ],
              titlesData: FlTitlesData(
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

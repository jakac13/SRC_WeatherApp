import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:weather_src/models/weather_forecast_model.dart';

class LineChartComponent extends StatefulWidget {
  const LineChartComponent({super.key, required this.WeatherForecastModel});

  final WeatherForecastModel;
  @override
  State<LineChartComponent> createState() => _LineChartComponentState();
}

class _LineChartComponentState extends State<LineChartComponent> {
  @override
  Widget build(BuildContext context) {
    return LineChart(LineChartData(
      maxX: 4,
      minX: -4,
      maxY: 50,
      minY: -20,
    ));
  }
}

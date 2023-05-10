import 'package:flutter/material.dart';
import 'package:weather_src/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => WeatherDataViewModel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: const HomeScreen(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Color(0xff0a090c),
          ),
          bodySmall: TextStyle(
            color: Color(0xff0a090c),
          ),
          bodyLarge: TextStyle(
            color: Color(0xff0a090c),
          ),
        ).apply(
          bodyColor: Color(0xff0a090c),
          displayColor: Colors.blue,
        ),
      ),
    );
  }
}

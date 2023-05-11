import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_src/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:weather_src/viewmodels/weather_data_view_model.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows) {
    WindowManager.instance.setMinimumSize(const Size(800, 600));
    WindowManager.instance.setMaximumSize(const Size(1200, 800));
  }
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

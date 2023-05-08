import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_src/services/location_service.dart';
import 'package:weather_src/utils/app_styles.dart';
import 'package:weather_src/services/weather_api_service.dart';
import 'package:geocoder_buddy/geocoder_buddy.dart';
import 'package:weather_src/models/lat_lng_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherApiService api = WeatherApiService();
  LocationService location = LocationService();
  LatLng latLng = LatLng("0", "0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              /* latLng = await location.searchLocation('Novo mesto'); */
              latLng = await location.currentLocation();
              setState(() {});
            },
            child: const Text('Get data'),
          ),
          Text(latLng.latitude + ", " + latLng.longitude),
        ],
      ),
    );
  }
}

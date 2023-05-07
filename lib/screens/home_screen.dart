import 'package:flutter/material.dart';
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
  List<GBSearchData> searchItem = [];
  Map<String, dynamic> details = {};
  LatLng? latLng;
  WeatherApiService api = WeatherApiService();
  GeocoderBuddy geocoderBuddy = GeocoderBuddy();

  Future<LatLng> searchLocation(String query) async {
    List<GBSearchData> data = await GeocoderBuddy.query(query);
    LatLng? latLng;
    if (data.isNotEmpty) {
      GBSearchData firstResult = data.first;
      latLng = LatLng(firstResult.lat, firstResult.lon);
    }
    setState(() {
      searchItem = data;
    });
    return latLng ?? LatLng("0", "0");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              latLng = await searchLocation('Ljubljana');
              setState(() {});
            },
            child: const Text('Get data'),
          ),
          Text(latLng!.latitude + ", " + latLng!.longitude)
        ],
      ),
    );
  }
}

import 'package:geocoder_buddy/geocoder_buddy.dart';
import 'package:weather_src/models/lat_lng_model.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<LatLng> searchLocation(String query) async {
    List<GBSearchData> data = await GeocoderBuddy.query(query);
    LatLng? latLng;
    if (data.isNotEmpty) {
      GBSearchData firstResult = data.first;
      latLng = LatLng(firstResult.lat, firstResult.lon);
    }
    return latLng ?? LatLng("0", "0");
  }

  Future<LatLng> currentLocation() async {
    LatLng? latLng;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latLng =
        LatLng(position.latitude.toString(), position.longitude.toString());
    return latLng;
  }
}

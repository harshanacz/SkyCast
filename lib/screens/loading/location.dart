import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  //GET LOCATION FUNCTION
  Future<void> getCurrentLoc() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("Location services are disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("denied!");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("deniedForever!");
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

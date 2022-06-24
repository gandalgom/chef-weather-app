import 'package:geolocator/geolocator.dart';

class MyLocation {

  double? latitude;
  double? longitude;

  String errorMessage = 'location info is empty';

  Future<void> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        errorMessage = 'Location services are disabled.';
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          errorMessage = 'Location services are disabled.';
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        errorMessage = 'Location permissions are permanently denied, '
          'we cannot request permissions.';
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );
      latitude = position.latitude;
      longitude = position.longitude;

    } catch(e) {
      errorMessage = e.toString();
    }
  }
}
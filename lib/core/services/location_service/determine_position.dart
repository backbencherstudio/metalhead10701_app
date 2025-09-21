import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  // Call this function wherever you need the current location
  Future<Map<String, dynamic>> determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied
      return Future.error('Location permissions are permanently denied.');
    }

    // When permissions are granted, get the current position
    final position = await Geolocator.getCurrentPosition();

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        final locationData = {
          'Area': place.subLocality ?? 'Unknown area',
          'City': place.locality ?? 'Unknown city',
          'Country': place.country ?? 'Unknown country',
        };

        return locationData;
      }
    } catch (e) {
      log('Error in reverse geocoding: $e');
      log('position: $position');
    }
    return {};
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:marketi/core/utils/location_permission_handler.dart';

abstract class GpsLocalDataSource {
  Future<LatLng> getCurrentLocation();
}

@LazySingleton(as: GpsLocalDataSource)
class GpsLocalDataSourceImpl implements GpsLocalDataSource {
  @override
  Future<LatLng> getCurrentLocation() async {
    await LocationPermissionHandler.ensurePermissionGranted();
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
    return LatLng(position.latitude, position.longitude);
  }
}

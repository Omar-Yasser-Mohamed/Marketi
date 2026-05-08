import 'package:injectable/injectable.dart';
import 'package:marketi/core/network/api_service.dart';

abstract class LocationRemoteDataSource {
  Future<String> getPlaceName(double lat, double lng);
}

@LazySingleton(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final ApiService _apiService;

  LocationRemoteDataSourceImpl(this._apiService);

  @override
  Future<String> getPlaceName(double lat, double lng) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$lng&format=json';

    final response = await _apiService.get(endpoint: url, headers: {
      'User-Agent': 'marketi_app',
    });

    return response.data['display_name'] ?? 'Unknown Location';
  }
}

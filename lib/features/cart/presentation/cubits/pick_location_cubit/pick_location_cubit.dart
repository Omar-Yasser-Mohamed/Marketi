import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/features/cart/domain/entities/map_location_entity.dart';
import 'package:marketi/features/cart/domain/use_cases/get_current_location_use_case.dart';
import 'package:marketi/features/cart/domain/use_cases/get_location_name_use_case.dart';

part 'pick_location_state.dart';

@Injectable()
class PickLocationCubit extends Cubit<PickLocationState> {
  PickLocationCubit(
    this._getCurrentLocationUseCase,
    this._locationNameUseCase,
  ) : super(PickLocationInitial());
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;
  final GetLocationNameUseCase _locationNameUseCase;

  void safeEmit(PickLocationState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getCurrentLocation() async {
    safeEmit(PickLocationLoading());
    final result = await _getCurrentLocationUseCase();
    result.fold(
      (failure) => safeEmit(PickLocationFailure(failure)),
      (location) => safeEmit(PickLocationSuccess(location, movedByGps: true)),
    );
  }

  Future<void> pickLocation({required double lat, required double lng}) async {
    final initialLocation = MapLocationEntity(lat: lat, lng: lng);

    safeEmit(PickLocationSuccessLoading(initialLocation));

    final result = await _locationNameUseCase(lat: lat, lng: lng);

    result.fold(
      (failure) => safeEmit(PickLocationFailure(failure)),
      (location) => safeEmit(PickLocationSuccess(location)),
    );
  }
}

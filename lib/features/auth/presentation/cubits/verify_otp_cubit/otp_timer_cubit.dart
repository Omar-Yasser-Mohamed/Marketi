import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtpTimerCubit extends Cubit<int> {
  OtpTimerCubit() : super(_initialSeconds);

  static const int _initialSeconds = 10 * 60;
  Timer? _timer;

  void start() {
    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (state <= 1) {
          emit(0);
          timer.cancel();
        } else {
          emit(state - 1);
        }
      },
    );
  }

  void reset() {
    emit(_initialSeconds);
    start();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/errors/failure.dart';
import 'package:marketi/core/errors/failure_code.dart';
import 'package:marketi/core/shared/models/payment_method.dart';
import 'package:marketi/features/cart/data/models/checkout_request.dart';
import 'package:marketi/features/cart/domain/repos/checkout_repo.dart';

part 'checkout_state.dart';

@injectable
class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._checkoutRepo) : super(CheckoutState());
  final CheckoutRepo _checkoutRepo;

  void safeEmit(CheckoutState newState) {
    if (!isClosed) emit(newState);
  }

  void setLocation(String location) =>
      safeEmit(state.copyWith(location: location));

  void setMobileNumber(String mobileNumber) =>
      safeEmit(state.copyWith(mobileNumber: mobileNumber));

  void setDetails(String details) => safeEmit(state.copyWith(details: details));

  void setPaymentMethod(PaymentMethod paymentMethod) =>
      safeEmit(state.copyWith(paymentMethod: paymentMethod));

  Future<void> submitOrder(String cartId) async {
    emit(state.copyWith(status: CheckoutStatus.loading));

    final request = CheckoutRequest(
      cartId: cartId,
      city: state.location!,
      phone: state.mobileNumber!,
      details: state.details ?? '',
    );

    switch (state.paymentMethod) {
      case CashOnDelivery():
        final result = await _checkoutRepo.createCashOrder(request);
        result.fold(
          (l) {
            safeEmit(state.copyWith(status: CheckoutStatus.failure, failure: l));
          },
          (r) {
            safeEmit(state.copyWith(status: CheckoutStatus.success));
          },
        );
        break;
      case OnlinePayment():
        final result = await _checkoutRepo.createOnlineOrder(request);
        result.fold(
          (l) {
            safeEmit(state.copyWith(status: CheckoutStatus.failure, failure: l));
          },
          (r) {
            safeEmit(state.copyWith(status: CheckoutStatus.success));
          },
        );
        break;
    }
    
  }

  void checkValidation() {
    if (state.location == null || state.mobileNumber == null) {
      safeEmit(
        state.copyWith(
          status: CheckoutStatus.failure,
          failure: const AppFailure(failureCode: FailureCode.validation),
        ),
      );
    }
  }
}

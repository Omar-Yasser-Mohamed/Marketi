part of 'checkout_cubit.dart';

enum CheckoutStatus { initial, loading, success, failure }

class CheckoutState {
  final String? location;
  final String? mobileNumber;
  final String? details;
  final PaymentMethod paymentMethod;
  final CheckoutStatus status;
  final Failure? failure;

  CheckoutState({
    this.location,
    this.mobileNumber,
    this.details,
    this.paymentMethod = const CashOnDelivery(),
    this.status = CheckoutStatus.initial,
    this.failure,
  });

  CheckoutState copyWith({
    String? location,
    String? mobileNumber,
    String? details,
    PaymentMethod? paymentMethod,
    CheckoutStatus? status,
    Failure? failure,
  }) {
    return CheckoutState(
      location: location ?? this.location,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      details: details ?? this.details,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}

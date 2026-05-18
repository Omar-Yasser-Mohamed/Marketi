part of 'checkout_cubit.dart';

enum CheckoutStatus {
  initial,
  loading,
  success,
  failure,
  onlinePaymentRedirecting,
}

class CheckoutState {
  final String? location;
  final String? mobileNumber;
  final String? details;
  final PaymentMethod paymentMethod;
  final CheckoutStatus status;
  final Failure? failure;
  final String? url;

  CheckoutState({
    this.location,
    this.mobileNumber,
    this.details,
    this.paymentMethod = const CashOnDelivery(),
    this.status = CheckoutStatus.initial,
    this.failure,
    this.url,
  });

  CheckoutState copyWith({
    String? location,
    String? mobileNumber,
    String? details,
    PaymentMethod? paymentMethod,
    CheckoutStatus? status,
    Object? failure = _sentinel,
    Object? url = _sentinel,
  }) {
    return CheckoutState(
      location: location ?? this.location,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      details: details ?? this.details,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      failure: failure == _sentinel ? this.failure : failure as Failure?,
      url: url == _sentinel ? this.url : url as String?,
    );
  }

  static const _sentinel = Object();
}

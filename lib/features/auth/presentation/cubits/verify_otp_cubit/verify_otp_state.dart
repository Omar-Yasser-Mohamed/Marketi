part of 'verify_otp_cubit.dart';

sealed class VerifyOtpState {}

final class VerifyOtpInitial extends VerifyOtpState {}

final class VerifyOtpLoading extends VerifyOtpState {}

final class VerifyOtpSuccess extends VerifyOtpState {}

final class VerifyOtpFailure extends VerifyOtpState {
  final Failure failure;

  VerifyOtpFailure(this.failure);
}

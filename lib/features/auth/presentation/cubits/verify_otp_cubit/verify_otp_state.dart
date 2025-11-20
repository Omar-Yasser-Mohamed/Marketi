part of 'verify_otp_cubit.dart';

abstract class VerifyOtpState {}

final class VerifyOtpInitial extends VerifyOtpState {}

final class VerifyOtpSuccess extends VerifyOtpState {
  final VerifyOtpResponse verifyOtpResponse;

  VerifyOtpSuccess(this.verifyOtpResponse);
}

final class VerifyOtpLoading extends VerifyOtpState {}

final class VerifyOtpFailure extends VerifyOtpState {
  final String errorMsg;

  VerifyOtpFailure(this.errorMsg);
}

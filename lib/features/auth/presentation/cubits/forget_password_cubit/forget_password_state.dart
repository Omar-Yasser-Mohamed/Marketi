part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;

  ForgetPasswordSuccess(this.message);
}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String errorMsg;

  ForgetPasswordFailure(this.errorMsg);
}

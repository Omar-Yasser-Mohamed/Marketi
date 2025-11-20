part of 'reset_password_cubit.dart';

abstract class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final String token;

  ResetPasswordSuccess(this.token);
}

final class ResetPasswordFailure extends ResetPasswordState {
  final String errorMsg;

  ResetPasswordFailure(this.errorMsg);
}

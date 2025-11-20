part of 'login_cubit.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess(this.token);
}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String errorMsg;

  LoginFailure(this.errorMsg);
}

part of 'register_cubit.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String token;

  RegisterSuccess(this.token);
}

final class RegisterLoading extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String errorMsg;

  RegisterFailure(this.errorMsg);
}

part of 'profile_cubit.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserEntity user;

  ProfileSuccess(this.user);
}

final class ProfileFailure extends ProfileState {
  final Failure failure;

  ProfileFailure(this.failure);
}

final class ProfileLogoutSuccess extends ProfileState {}

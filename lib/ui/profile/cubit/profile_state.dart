part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileDataLoaded extends ProfileState {
  final UserResponseModel userResponseModel;

  ProfileDataLoaded({required this.userResponseModel});
}

final class ProfileDataLoading extends ProfileState {}

final class ProfileLogout extends ProfileState {}

part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInUserLoginLoading extends SignInState {}

final class SignInUserLoginFaield extends SignInState {}

final class SignInUserLoginSuccess extends SignInState {}

final class SignInFormNotValidated extends SignInState {}
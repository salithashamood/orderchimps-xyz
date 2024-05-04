part of 'onboard_cubit.dart';

@immutable
sealed class OnboardState {}

final class OnboardInitial extends OnboardState {}

final class OnboardMoveToLogin extends OnboardState {}

final class OnboardMoveToHome extends OnboardState {}

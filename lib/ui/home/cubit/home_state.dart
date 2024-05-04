part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeProductFetching extends HomeState {}

final class HomeProductFetched extends HomeState {}

final class HomeLocationPermitionDenieded extends HomeState {}

final class HomeLocationFetching extends HomeState {}

final class HomeLocationCannotFetch extends HomeState {}

final class HomeLocationFetched extends HomeState {
  final String country;

  HomeLocationFetched({required this.country});
}

final class HomeScrollHorizontal extends HomeState {
  final int index;
  HomeScrollHorizontal({this.index = 0});
}

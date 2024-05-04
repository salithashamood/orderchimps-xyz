part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeScrollHorizontal extends HomeState {
  final int index;
  HomeScrollHorizontal({this.index = 0});
}

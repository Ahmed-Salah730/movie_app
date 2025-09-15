part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List topRated;
  final List action;
  final List adventure;
  final List drama;
  final List comedy;

  HomeLoaded({
    required this.topRated,
    required this.action,
    required this.adventure,
    required this.drama,
    required this.comedy,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}

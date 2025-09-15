part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppChangeTab extends AppState {
  final int tabIndex;

  AppChangeTab(this.tabIndex);
}

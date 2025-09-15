import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  int currentTab = 0;

  void changeTab(int index) {
    currentTab = index;
    emit(AppChangeTab(index));
  }
}

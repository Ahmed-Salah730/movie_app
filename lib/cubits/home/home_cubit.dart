import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final Dio _dio = Dio();

  List topRated = [];
  List action = [];
  List adventure = [];
  List drama = [];
  List comedy = [];

  Future<void> fetchHomeData() async {
    emit(HomeLoading());

    try {
// 🟡 Top Rated
      final topRatedRes = await _dio
          .get("https://yts.mx/api/v2/list_movies.json", queryParameters: {
        "sort_by": "rating",
        "limit": 10,
      });
      topRated = topRatedRes.data["data"]["movies"] ?? [];

// 🔵 Action
      final actionRes = await _dio
          .get("https://yts.mx/api/v2/list_movies.json", queryParameters: {
        "genre": "action",
        "limit": 10,
      });
      action = actionRes.data["data"]["movies"] ?? [];

// 🟢 Adventure
      final adventureRes = await _dio
          .get("https://yts.mx/api/v2/list_movies.json", queryParameters: {
        "genre": "adventure",
        "limit": 10,
      });
      adventure = adventureRes.data["data"]["movies"] ?? [];

// 🔴 Drama
      final dramaRes = await _dio
          .get("https://yts.mx/api/v2/list_movies.json", queryParameters: {
        "genre": "drama",
        "limit": 10,
      });
      drama = dramaRes.data["data"]["movies"] ?? [];

// 🟣 Comedy
      final comedyRes = await _dio
          .get("https://yts.mx/api/v2/list_movies.json", queryParameters: {
        "genre": "comedy",
        "limit": 10,
      });
      comedy = comedyRes.data["data"]["movies"] ?? [];

      emit(HomeLoaded(
        topRated: topRated,
        action: action,
        adventure: adventure,
        drama: drama,
        comedy: comedy,
      ));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}

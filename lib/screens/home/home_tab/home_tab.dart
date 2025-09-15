import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../movie_details/movie_details_screen.dart';

class Movie {
  final int id;
  final String title;
  final String posterUrl;
  final double rating;

  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      posterUrl: json["medium_cover_image"] ?? "",
      rating: (json["rating"] is int)
          ? (json["rating"] as int).toDouble()
          : (json["rating"] ?? 0.0).toDouble(),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Map<String, List<Movie>> moviesByGenre = {};
  List<Movie> availableNow = [];
  bool isLoading = true;

  final List<String> genres = [
    "Action",
    "Comedy",
    "Drama",
    "Horror",
    "Romance",
    "Sci-Fi",
    "Thriller"
  ];

  @override
  void initState() {
    super.initState();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    setState(() => isLoading = true);
    try {
      // Available Now Section (latest movies)
      final response = await http.get(Uri.parse(
          "https://yts.mx/api/v2/list_movies.json?sort_by=year&limit=10"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final moviesJson = data["data"]["movies"] as List?;
        if (moviesJson != null) {
          availableNow = moviesJson.map((e) => Movie.fromJson(e)).toList();
        }
      }

      // Other Genres
      for (var genre in genres) {
        final res = await http.get(Uri.parse(
            "https://yts.mx/api/v2/list_movies.json?genre=$genre&limit=10"));
        if (res.statusCode == 200) {
          final data = json.decode(res.body);
          final moviesJson = data["data"]["movies"] as List?;
          if (moviesJson != null) {
            moviesByGenre[genre] =
                moviesJson.map((e) => Movie.fromJson(e)).toList();
          }
        }
      }
    } catch (e) {
      print("Error fetching movies: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // 430
    double screenHeight = MediaQuery.of(context).size.height; // 932

    return Stack(
      children: [
        // الخلفية
        Image.asset(
          AppImages.intro5,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xCC121312), Color(0x99121312), Color(0xff121312)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: AppColors.yellow))
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Available Now Section
                        Center(child: Image.asset(AppImages.availableNow)),
                        SizedBox(height: screenHeight * 0.02),

                        SizedBox(
                          height: screenHeight * 0.35,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: availableNow.length,
                            itemBuilder: (context, index) {
                              final movie = availableNow[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          MovieDetailsScreen(movieId: movie.id),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: screenWidth * 0.45,
                                  margin: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            movie.posterUrl,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        movie.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.star,
                                              color: AppColors.yellow,
                                              size: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            movie.rating.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.03),

                        // Other Genres Sections
                        ...genres.map((genre) {
                          final movies = moviesByGenre[genre] ?? [];
                          if (movies.isEmpty) return const SizedBox.shrink();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  genre,
                                  style: const TextStyle(
                                    color: AppColors.yellow,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.3,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movies.length,
                                  itemBuilder: (context, index) {
                                    final movie = movies[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => MovieDetailsScreen(
                                                movieId: movie.id),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: screenWidth * 0.4,
                                        margin: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  movie.posterUrl,
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              movie.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.star,
                                                    color: AppColors.yellow,
                                                    size: 16),
                                                const SizedBox(width: 4),
                                                Text(
                                                  movie.rating.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

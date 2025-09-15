import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
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
      id: (json["id"] ?? 0) as int,
      title: json["title"] ?? "",
      posterUrl: json["medium_cover_image"] ?? "",
      rating:
          (json["rating"] != null) ? (json["rating"] as num).toDouble() : 0.0,
    );
  }
}

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  List<String> categories = [];
  int selectedIndex = 0;
  List<Movie> movies = [];
  bool isLoadingCategories = false;
  bool isLoadingMovies = false;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    setState(() => isLoadingCategories = true);
    try {
      final response = await http.get(
        Uri.parse("https://yts.mx/api/v2/list_movies.json?limit=50"),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final moviesJson = data["data"]["movies"] as List;

        Set<String> genresSet = {};
        for (var m in moviesJson) {
          if (m["genres"] != null) {
            for (var g in m["genres"]) {
              genresSet.add(g.toString());
            }
          }
        }

        categories = genresSet.toList();

        if (categories.isNotEmpty) {
          await fetchMoviesByCategory(categories[selectedIndex]);
        }
      }
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      setState(() => isLoadingCategories = false);
    }
  }

  Future<void> fetchMoviesByCategory(String genre) async {
    setState(() => isLoadingMovies = true);
    try {
      final response = await http.get(
        Uri.parse(
            "https://yts.mx/api/v2/list_movies.json?genre=$genre&limit=30"),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final moviesJson = data["data"]["movies"] as List?;
        if (moviesJson != null) {
          movies = moviesJson.map((e) => Movie.fromJson(e)).toList();
        } else {
          movies = [];
        }
      }
    } catch (e) {
      print("Error fetching movies: $e");
    } finally {
      setState(() => isLoadingMovies = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.01,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            children: [
              // --- Categories ---
              SizedBox(
                height: screenHeight * 0.08,
                child: isLoadingCategories
                    ? const Center(
                        child:
                            CircularProgressIndicator(color: AppColors.yellow),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          bool isSelected = index == selectedIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() => selectedIndex = index);
                              fetchMoviesByCategory(categories[index]);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.yellow
                                    : AppColors.black,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: AppColors.yellow, width: 1),
                              ),
                        child: Text(
                          categories[index],
                                style: isSelected
                                    ? AppStyles.yellow20Bold
                                        .copyWith(color: AppColors.black)
                                    : AppStyles.yellow20Bold,
                              ),
                      ),
                          );
                        },
                      ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // --- Movies Grid ---
              Expanded(
                child: isLoadingMovies
                    ? const Center(
                        child:
                            CircularProgressIndicator(color: AppColors.yellow),
                      )
                    : GridView.builder(
                        itemCount: movies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                    crossAxisSpacing: screenWidth * 0.02,
                    mainAxisSpacing: screenHeight * 0.02,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                          final movie = movies[index];
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
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: movie.posterUrl.isNotEmpty
                                      ? Image.network(movie.posterUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity)
                                      : Container(color: Colors.grey),
                                ),
                                if (movie.rating > 0)
                                  Positioned(
                                    top: 6,
                                    left: 6,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.star,
                                              color: Colors.yellow, size: 14),
                                          const SizedBox(width: 2),
                                          Text(
                                            movie.rating.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

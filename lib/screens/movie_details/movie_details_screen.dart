import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  Map<String, dynamic>? movieData;
  List<dynamic> similarMovies = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
  }

  Future<void> fetchMovieDetails() async {
    setState(() => isLoading = true);
    try {
      final response = await http.get(
        Uri.parse(
          "https://yts.mx/api/v2/movie_details.json?movie_id=${widget.movieId}&with_images=true&with_cast=true",
        ),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        movieData = data["data"]["movie"];
        await fetchSimilarMovies(widget.movieId);
      }
    } catch (e) {
      print("Error fetching movie details: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> fetchSimilarMovies(int id) async {
    try {
      final response = await http.get(
        Uri.parse("https://yts.mx/api/v2/movie_suggestions.json?movie_id=$id"),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        similarMovies = data["data"]["movies"] ?? [];
      }
    } catch (e) {
      print("Error fetching similar movies: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.yellow),
        ),
      );
    }

    if (movieData == null) {
      return const Scaffold(
        body: Center(
          child: Text("No details available",
              style: TextStyle(color: Colors.white)),
        ),
      );
    }

    String description =
        movieData!["description_full"]?.toString().trim() ?? "";
    if (description.isEmpty) {
      description = movieData!["synopsis"]?.toString().trim() ??
          "No description available.";
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster with Play Button
            Stack(
              children: [
                Image.network(
                  movieData!["large_cover_image"],
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: BackButton(color: Colors.white),
                ),
                Positioned(
                  top: 120,
                  left: MediaQuery.of(context).size.width / 2 - 30,
                  child: Icon(Icons.play_circle_fill,
                      color: AppColors.yellow, size: 60),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    movieData!["title"] ?? "",
                    style: AppStyles.yellow20Bold.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 8),

                  // Watch Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    child: const Text("Watch",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),

                  const SizedBox(height: 16),

                  // Info Row (year, runtime, likes, rating)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _infoItem(Icons.calendar_today, "${movieData!["year"]}"),
                      _infoItem(
                          Icons.access_time, "${movieData!["runtime"] ?? 0}m"),
                      _infoItem(
                          Icons.favorite, "${movieData!["like_count"] ?? 0}"),
                      _infoItem(Icons.star, "${movieData!["rating"] ?? "N/A"}"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Screenshots
                  if (movieData!["large_screenshot_image1"] != null) ...[
                    Text("Screen Shots", style: AppStyles.yellow20Bold),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          if (movieData!["large_screenshot_image1"] != "")
                            _screenshot(movieData!["large_screenshot_image1"]),
                          if (movieData!["large_screenshot_image2"] != "")
                            _screenshot(movieData!["large_screenshot_image2"]),
                          if (movieData!["large_screenshot_image3"] != "")
                            _screenshot(movieData!["large_screenshot_image3"]),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),

                  // Similar Movies
                  if (similarMovies.isNotEmpty) ...[
                    Text("Similar", style: AppStyles.yellow20Bold),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: similarMovies.length,
                        itemBuilder: (context, index) {
                          final sim = similarMovies[index];
                          return Container(
                            width: 120,
                            margin: const EdgeInsets.only(right: 8),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                      sim["medium_cover_image"],
                                      fit: BoxFit.cover),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  sim["title"],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],

                  const SizedBox(height: 20),

                  // Summary
                  Text("Summary", style: AppStyles.yellow20Bold),
                  const SizedBox(height: 8),
                  Text(description,
                      style: const TextStyle(color: Colors.white70)),

                  const SizedBox(height: 20),

                  // Cast
                  if (movieData!["cast"] != null) ...[
                    Text("Cast", style: AppStyles.yellow20Bold),
                    const SizedBox(height: 8),
                    Column(
                      children: (movieData!["cast"] as List).map((c) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(c["url_small_image"] ?? ""),
                            ),
                            title: Text(c["name"],
                                style: const TextStyle(color: Colors.white)),
                            subtitle: Text(c["character_name"] ?? "",
                                style: const TextStyle(color: Colors.white70)),
                          ),
                        );
                      }).toList(),
                    )
                  ],

                  const SizedBox(height: 20),

                  // Genres
                  if (movieData!["genres"] != null) ...[
                    Text("Genres", style: AppStyles.yellow20Bold),
                    Wrap(
                      spacing: 8,
                      children: (movieData!["genres"] as List).map((g) {
                        return Chip(
                          label: Text(g,
                              style: const TextStyle(color: Colors.black)),
                          backgroundColor: AppColors.yellow,
                        );
                      }).toList(),
                    )
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: AppColors.yellow),
        const SizedBox(height: 4),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _screenshot(String url) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(url, fit: BoxFit.cover, width: 200),
      ),
    );
  }
}

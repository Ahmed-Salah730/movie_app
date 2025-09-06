import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:movie_app/utils/app_styles.dart';

import '../../../utils/app_colors.dart';

class ExploreTab extends StatelessWidget {
  ExploreTab({super.key});

  static List<String> categories = [
    "Adventure",
    "Action",
    "Documentary",
    "Animation",
    "Biology",
    "Islamic",
    "Historical",
  ];

  static List<String> imagePaths = [
    AppImages.movie1,
    AppImages.movie2,
    AppImages.movie3,
    AppImages.movie4,
    AppImages.movie2,
    AppImages.movie3,
    AppImages.movie1,
    AppImages.movie2,
    AppImages.movie3,
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

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
              SizedBox(
                height: screenHeight * 0.08,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.yellow, width: 1),
                        ),
                        child: Text(
                          categories[index],
                          style: AppStyles.yellow20Bold,
                        ),
                      ),
                  itemCount: categories.length,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Expanded(
                child: GridView.builder(
                  itemCount: imagePaths.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: screenWidth * 0.02,
                    mainAxisSpacing: screenHeight * 0.02,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    return Image.asset(imagePaths[index]);
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

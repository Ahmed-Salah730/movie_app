import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_images.dart';

import '../../../utils/widgets/login_text_field.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          LoginTextField(hintText: "Search", prefixIcon: Icon(Icons.search)),

          SizedBox(height: screenHeight * 0.3),
          Center(child: Image.asset(AppImages.emptySearch)),
        ],
      ),
    );
  }
}

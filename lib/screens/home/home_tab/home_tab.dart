import 'package:flutter/material.dart';

import '../../../utils/app_images.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return Stack(
      children: [
        Image.asset(
          AppImages.intro5,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          decoration: BoxDecoration(
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
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    //SizedBox(height: screenHeight * 0.01),
                    Image.asset(AppImages.availableNow),
                    SizedBox(height: screenHeight * 0.02),
                    Image.asset(
                      AppImages.homePoster,
                      height: screenHeight * 0.38,
                      width: screenWidth * 0.54,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Image.asset(
                      AppImages.watchNow,
                      height: screenHeight * 0.16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
    ;
  }
}

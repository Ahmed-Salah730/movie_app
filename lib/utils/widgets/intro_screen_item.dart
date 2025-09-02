import 'package:flutter/material.dart';
import 'package:movie_app/utils/widgets/back_button.dart';
import '../../screens/login/login_screen.dart';
import '../app_colors.dart';
import '../app_styles.dart';
import 'intro_button.dart';

class IntroScreenItem extends StatelessWidget {
  final PageController controller;

  final String imagePath;
  final String title;
  final String buttonText;
  final String? description;
  final String? backText;
  final LinearGradient gradient;

  IntroScreenItem({
    super.key,
    required this.imagePath,
    required this.gradient,
    required this.title,
    this.description,
    this.backText,
    required this.controller,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          imagePath,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenHeight * 0.035,
          ),
          decoration: BoxDecoration(gradient: gradient),
        ),
        IntrinsicHeight(
          child: Container(
            padding: EdgeInsets.only(top: screenHeight * 0.05),
            width: double.infinity,
            //height: 300,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppStyles.white36medium.copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.008),
                //Text("Favorite Movie Here", style: AppStyles.white36medium, textAlign: TextAlign.center,),
                SizedBox(height: screenHeight * 0.026),

                description != null
                    ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            description!,
                            style: AppStyles.whiteO20Regular.copyWith(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.026),
                      ],
                    )
                    : SizedBox.shrink(),

                SizedBox(height: screenHeight * 0.008),

                // Text("library of movies to suit all tastes.  ", style: AppStyles.whiteO20Regular,),
                IntroButton(
                  text: buttonText,
                  onPressed: () {
                    toNextPage(context);
                    //controller.nextPage(duration: Duration(milliseconds: 400 ), curve: Curves.easeInOut);
                  },
                ),

                SizedBox(height: screenHeight * 0.026),

                BackIntroButton(
                  text: "Back",
                  onPressed: () {
                    controller.previousPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  toNextPage(BuildContext context) {
    if (buttonText == "Finish") {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else {
      controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:movie_app/utils/widgets/intro_button.dart';
import 'package:movie_app/utils/widgets/intro_screen_item.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = "/intro";
  final PageController _controller = PageController();

  IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return PageView(
      controller: _controller,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              AppImages.moviePosters,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenHeight * 0.035,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x001e1e1e),
                    Color(0x80121312),
                    Color(0xE8121312),
                    Color(0xff121312),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Find Your Next ",
                    style: AppStyles.white36medium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  Text(
                    "Favorite Movie Here",
                    style: AppStyles.white36medium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.026),
                  Text(
                    "Get access to a huge ",
                    style: AppStyles.whiteO20Regular,
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  Text(
                    "library of movies to suit all tastes.  ",
                    style: AppStyles.whiteO20Regular,
                  ),
                  SizedBox(height: screenHeight * 0.026),

                  IntroButton(
                    text: "Explore Now",
                    onPressed: () {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              AppImages.intro1,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenHeight * 0.035,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x00084250), Color(0xff084250)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Discover Movies ",
                    style: AppStyles.white36medium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  //Text("Favorite Movie Here", style: AppStyles.white36medium, textAlign: TextAlign.center,),
                  SizedBox(height: screenHeight * 0.026),
                  Text(
                    "Explore a lot of movies ",
                    style: AppStyles.whiteO20Regular.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.008),
                  // Text("library of movies to suit all tastes.  ", style: AppStyles.whiteO20Regular,),
                  SizedBox(height: screenHeight * 0.026),

                  IntroButton(
                    text: "Next",
                    onPressed: () {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

        IntroScreenItem(
          imagePath: AppImages.intro2,
          buttonText: "Next",
          gradient: LinearGradient(
            colors: [Color(0x0085210E), Color(0xff85210E)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          controller: _controller,
          title: "Explore All Genres",
          description:
              "Discover movies from every genre, in all\navailable qualities. Find something new\nand exciting to watch every day.",
          backText: "Back",
        ),

        IntroScreenItem(
          imagePath: AppImages.intro3,
          buttonText: "Next",
          gradient: LinearGradient(
            colors: [Color(0x004C2471), Color(0xff4C2471)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          controller: _controller,
          title: "Create Watchlists",
          description:
              "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
          backText: "Back",
        ),

        IntroScreenItem(
          imagePath: AppImages.intro4,
          buttonText: "Next",
          gradient: LinearGradient(
            colors: [Color(0x00601321), Color(0xff601321)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          controller: _controller,
          title: "Rate, Review, and Learn",
          description:
              "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
          backText: "Back",
        ),

        IntroScreenItem(
          imagePath: AppImages.intro5,
          buttonText: "Finish",
          gradient: LinearGradient(
            colors: [Color(0x002A2C30), Color(0xff2A2C30)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          controller: _controller,
          title: "Start Watching Now",
          backText: "Back",
        ),
      ],
    );
  }
}

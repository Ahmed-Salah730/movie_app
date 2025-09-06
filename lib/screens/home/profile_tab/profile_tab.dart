import 'package:flutter/material.dart';
import 'package:movie_app/screens/login/login_screen.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:movie_app/utils/app_styles.dart';
import 'package:movie_app/utils/widgets/intro_button.dart';

import '../../../utils/app_colors.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 8, right: 8, left: 8),
            color: AppColors.gray,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.13,
                          width: screenWidth * 0.27,
                          child: CircleAvatar(
                            foregroundImage: AssetImage(AppImages.avatar),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "Ahmed   Salah",
                          style: AppStyles.white36medium.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Text(
                          "12",
                          style: AppStyles.white36medium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "Wish  List",
                          style: AppStyles.white36medium.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10",
                          style: AppStyles.white36medium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "History",
                          style: AppStyles.white36medium.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),

                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: IntroButton(
                        text: "Edit Profile",
                        onPressed: () {},
                      ),
                    ),

                    SizedBox(width: screenWidth * 0.02),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            LoginScreen.routeName,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          fixedSize: Size(
                            screenWidth * 0.94,
                            screenHeight * 0.06,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Exit", style: AppStyles.white16Regular),
                            Icon(Icons.exit_to_app, color: AppColors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Icon(Icons.list, size: 40, color: AppColors.yellow),
                          Text("Watch List", style: AppStyles.white16Regular),
                        ],
                      ),
                    ),

                    SizedBox(width: screenWidth * 0.02),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.folder, size: 40, color: AppColors.yellow),
                          Text("History", style: AppStyles.white16Regular),
                          Container(color: AppColors.yellow, height: 2),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.08),
          Center(child: Image.asset(AppImages.emptySearch)),
        ],
      ),
    );
  }
}

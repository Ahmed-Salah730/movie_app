import 'package:flutter/material.dart';
import 'package:movies_app/screens/update_profile/update_profile.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/widgets/intro_button.dart';
import '../../login/login_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  static const String routeName = "/profile";

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
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
                          child: const CircleAvatar(
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
                          "0",
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
                          "0",
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
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, UpdateProfile.routeName);
                        },
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
                        child: const Row(
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
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Column(
                          children: [
                            const Icon(Icons.list,
                                size: 40, color: AppColors.yellow),
                            const Text("Watch List",
                                style: AppStyles.white16Regular),
                            const SizedBox(height: 8),
                            Container(
                              height: 3,
                              color: selectedIndex == 0
                                  ? AppColors.yellow
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Column(
                          children: [
                            const Icon(Icons.folder,
                                size: 40, color: AppColors.yellow),
                            const Text("History",
                                style: AppStyles.white16Regular),
                            const SizedBox(height: 8),
                            Container(
                              height: 3,
                              color: selectedIndex == 1
                                  ? AppColors.yellow
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // SizedBox(height: screenHeight * 0.02),
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

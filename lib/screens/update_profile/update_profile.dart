import 'package:flutter/material.dart';
import 'package:movies_app/screens/home/home_screen.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/widgets/intro_button.dart';
import 'package:movies_app/utils/widgets/login_text_field.dart';

import '../../utils/app_colors.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  static const String routeName = "/update";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppColors.yellow,
            )),
        centerTitle: true,
        title: const Text(
          "Pick Avatar ",
          style: AppStyles.yellow14Regular,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.2,
            ),
            const LoginTextField(
                hintText: "Ahmed Salah", prefixIcon: Icon(Icons.person)),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            const LoginTextField(
                hintText: "01017896030", prefixIcon: Icon(Icons.phone)),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
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
              child: Text("Delete Account",
                  style: AppStyles.white16Regular.copyWith(fontSize: 20)),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            IntroButton(text: "Update Data ", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

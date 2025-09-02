import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_styles.dart';
import 'package:movie_app/utils/widgets/intro_button.dart';
import '../../utils/widgets/login_text_field.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 24,
            color: AppColors.yellow,
          ),
        ),
        title: Text("Register", style: AppStyles.yellow14Regular),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.2),
            LoginTextField(
              hintText: "Name",
              prefixIcon: Icon(Icons.person, size: 30),
            ),
            SizedBox(height: screenHeight * 0.02),
            LoginTextField(
              hintText: "Email",
              prefixIcon: Icon(Icons.email, size: 30),
            ),
            SizedBox(height: screenHeight * 0.02),
            LoginTextField(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock, size: 30),
            ),
            SizedBox(height: screenHeight * 0.02),
            LoginTextField(
              hintText: "Confirm Password",
              prefixIcon: Icon(Icons.lock, size: 30),
            ),
            SizedBox(height: screenHeight * 0.02),
            LoginTextField(
              hintText: "Phone Number",
              prefixIcon: Icon(Icons.phone, size: 30),
            ),
            SizedBox(height: screenHeight * 0.03),
            IntroButton(text: "Create Account", onPressed: () {}),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have an account ?",
                  style: AppStyles.yellow14Regular.copyWith(
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: screenWidth * 0.01),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginScreen.routeName,
                    );
                  },
                  child: Text("Login", style: AppStyles.yellow14Regular),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Image.asset("assets/images/Language.png"),
          ],
        ),
      ),
    );
  }
}

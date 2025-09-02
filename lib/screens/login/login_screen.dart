import 'package:flutter/material.dart';
import 'package:movie_app/utils/widgets/login_text_field.dart';
import 'package:movie_app/screens/register/register_screen.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:movie_app/utils/app_styles.dart';
import 'package:movie_app/utils/widgets/intro_button.dart';
import '../../utils/app_colors.dart';
import '../forget_password/forget_password.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,

        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Image.asset(AppImages.logo),
              SizedBox(height: screenHeight * 0.07),
              LoginTextField(
                hintText: "Email",
                prefixIcon: Icon(Icons.email, size: 30),
              ),
              SizedBox(height: screenHeight * 0.02),
              LoginTextField(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock, size: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        ForgetPassword.routeName,
                      );
                    },
                    child: Text(
                      "Forget Password ?",
                      style: AppStyles.yellow14Regular,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.035),
              IntroButton(text: 'Login', onPressed: () {}),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: AppStyles.yellow14Regular.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RegisterScreen.routeName,
                      );
                    },
                    child: Text("Create One", style: AppStyles.yellow14Regular),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.24,
                    height: 1,
                    color: AppColors.yellow,
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Text("OR", style: AppStyles.yellow14Regular),
                  SizedBox(width: screenWidth * 0.03),
                  Container(
                    width: screenWidth * 0.24,
                    height: 1,
                    color: AppColors.yellow,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.035),
              IntroButton(text: 'Login With Google', onPressed: () {}),
              SizedBox(height: screenHeight * 0.03),
              Image.asset("assets/images/Language.png"),
            ],
          ),
        ),
      ),
    );
  }
}

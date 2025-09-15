import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../../utils/widgets/intro_button.dart';
import '../../utils/widgets/login_text_field.dart';
import '../home/home_screen.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Image.asset(AppImages.logo),
                SizedBox(height: screenHeight * 0.07),

                // Email
                LoginTextField(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email, size: 30),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email required";
                    }
                    String pattern = r'^[^@]+@[^@]+\.[^@]+';
                    if (!RegExp(pattern).hasMatch(value)) {
                      return "Invalid email";
                    }
                    return null;
                  },
                ),

                // Password
                LoginTextField(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock, size: 30),
                  controller: passwordController,
                  obscureText: obscurePassword,
                  toggleObscure: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),

                SizedBox(height: screenHeight * 0.035),

                // Login Button
                IntroButton(
                  text: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                        context,
                        HomeScreen.routeName,
                      );
                    }
                  },
                ),

                SizedBox(height: screenHeight * 0.03),

                // Register Text
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
                      child: const Text("Create One",
                          style: AppStyles.yellow14Regular),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.04),

                // Divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.24,
                      height: 1,
                      color: AppColors.yellow,
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    const Text("OR", style: AppStyles.yellow14Regular),
                    SizedBox(width: screenWidth * 0.03),
                    Container(
                      width: screenWidth * 0.24,
                      height: 1,
                      color: AppColors.yellow,
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.035),

                // Google Button
                IntroButton(text: 'Login With Google', onPressed: () {}),

                SizedBox(height: screenHeight * 0.03),
                Image.asset("assets/images/Language.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../utils/widgets/intro_button.dart';
import '../../utils/widgets/login_text_field.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "/register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // 430
    double screenHeight = MediaQuery.of(context).size.height; // 932

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 24,
            color: AppColors.yellow,
          ),
        ),
        title: const Text("Register", style: AppStyles.yellow14Regular),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.15),

              // Name
              LoginTextField(
                hintText: "Name",
                prefixIcon: const Icon(Icons.person, size: 30),
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name required";
                  }
                  return null;
                },
              ),

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

              // Confirm Password
              LoginTextField(
                hintText: "Confirm Password",
                prefixIcon: const Icon(Icons.lock, size: 30),
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                toggleObscure: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm password required";
                  }
                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),

              // Phone
              LoginTextField(
                hintText: "Phone Number",
                prefixIcon: const Icon(Icons.phone, size: 30),
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone number required";
                  }
                  return null;
                },
              ),

              SizedBox(height: screenHeight * 0.03),

              // Create Account
              IntroButton(
                text: "Create Account",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: API call for register
                  }
                },
              ),

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
                    child:
                        const Text("Login", style: AppStyles.yellow14Regular),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),
              Image.asset("assets/images/Language.png"),
            ],
          ),
        ),
      ),
    );
  }
}

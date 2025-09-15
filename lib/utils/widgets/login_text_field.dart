import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_styles.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? toggleObscure;

  const LoginTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.toggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return Container(
      color: Colors.transparent,
      height: screenHeight * 0.09,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        style: AppStyles.white16Regular,
        cursorColor: AppColors.white,
        decoration: InputDecoration(
          fillColor: AppColors.gray,
          filled: true,
          hintText: hintText,
          hintStyle: AppStyles.white16Regular,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.gray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.yellow),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01,
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.white,
          suffixIcon: toggleObscure != null
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.white,
                  ),
                  onPressed: toggleObscure,
                )
              : null,
        ),
      ),
    );
  }
}

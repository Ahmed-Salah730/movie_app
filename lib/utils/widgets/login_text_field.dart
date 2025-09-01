import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_styles.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  const LoginTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;       //  430
    double screenHeight = MediaQuery.of(context).size.height;     //  932

    return Container(
      color: Colors.transparent,
      height: screenHeight * 0.06,
      child: TextFormField(
        style: AppStyles.white16Regular,
        cursorColor: AppColors.white,
        decoration: InputDecoration(
          fillColor: AppColors.gray,
          filled: true,
          hintText: hintText,
          hintStyle: AppStyles.white16Regular,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.gray)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.gray)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.gray)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.gray)
          ),
          contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.014),
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.white
        ),
      ),
    );
  }
}

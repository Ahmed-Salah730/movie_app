import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_styles.dart';

class BackIntroButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  BackIntroButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width; //  430
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height; //  932

    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: AppColors.yellow)
            ),

            fixedSize: Size(screenWidth * 0.94, screenHeight * 0.06)
        ),
        child: Text(text,
          style: AppStyles.black20w600.copyWith(color: AppColors.yellow),));
  }
}
import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_styles.dart';

class IntroButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  IntroButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; //  430
    double screenHeight = MediaQuery.of(context).size.height; //  932

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        fixedSize: Size(screenWidth * 0.94, screenHeight * 0.06),
      ),
      child: Text(text, style: AppStyles.black20w600),
    );
  }
}

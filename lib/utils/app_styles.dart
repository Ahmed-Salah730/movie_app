import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static const TextStyle white36medium = TextStyle(
    color: AppColors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    wordSpacing: -8,
  );

  static const TextStyle whiteO20Regular = TextStyle(
    color: AppColors.white60,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    wordSpacing: 0,
  );

  static const TextStyle white16Regular = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    wordSpacing: 0,
  );

  static const TextStyle yellow14Regular = TextStyle(
    color: AppColors.yellow,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle yellow20Bold = TextStyle(
    color: AppColors.yellow,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle black20w600 = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  );
}

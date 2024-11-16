import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 class MyAppTheme{
 static ThemeData lightTheme= ThemeData(
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.greenColor
      ),
      titleLarge:  TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor
      ),
      titleSmall:  TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        color: AppColors.greenColor
      ),
      headlineMedium: TextStyle(
          fontSize: 18.sp,
          color: AppColors.blackColor,
        fontWeight: FontWeight.w500
      ),
    )
  );
}
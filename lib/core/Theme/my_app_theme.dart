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
      headlineSmall: TextStyle(
          fontSize: 18.sp,
          color: AppColors.greyColor2,
      ),
      bodyMedium:  TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor
      ),
      bodyLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor
      ),
      bodySmall: TextStyle(
        fontSize: 18.sp,
        color: AppColors.greenColor,
        fontWeight: FontWeight.w500
    ),
      displayMedium: TextStyle(
        fontSize: 12.sp,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w700
      ),
        displaySmall: TextStyle(
            fontSize: 11.sp,
            color: AppColors.greyColor2,
        )
    ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     backgroundColor: Colors.white,
     unselectedItemColor: AppColors.blackColor,
     selectedItemColor: AppColors.greenColor,
     showSelectedLabels: true,
     showUnselectedLabels: true,
     selectedLabelStyle: TextStyle(fontSize: 10.sp),
     unselectedLabelStyle: TextStyle(fontSize: 10.sp),
     elevation: 0,

   )
  );
}
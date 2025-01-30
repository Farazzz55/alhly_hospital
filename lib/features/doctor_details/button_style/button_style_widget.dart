import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/Colors/app_colors.dart';

class ButtonStyleWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  ButtonStyleWidget({required this.title, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.w,
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              )),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.greenColor : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(color: AppColors.greenColor)),
        ),
      ),
    );
  }
}

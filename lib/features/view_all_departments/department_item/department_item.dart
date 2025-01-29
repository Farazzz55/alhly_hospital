import 'package:alhly_hospital/features/view_all_departments/specialist/specialist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DepartmentItem extends StatelessWidget{
  String imgPath;
  String title;
  DepartmentItem({required this.imgPath,required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      child: Row(
        children: [
          Image.asset(imgPath, width: 40.w, height: 40.h),
          SizedBox(width: 10.w),
          Text(
            title,
            style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
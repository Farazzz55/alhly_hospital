import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  String title;
  String img;
  CategoryWidget({required this.img,required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92.w,
      height: 104.h,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(img),
          SizedBox(height: 10.h,),
          Text(title,style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 11.sp,
              )
          ),)
        ],
      ),
    );

  }
}

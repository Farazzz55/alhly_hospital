import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/Colors/app_colors.dart';

class InputEditProfile extends StatelessWidget{
  String label;
  String content;
  InputEditProfile({required this.label,required this.content});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,  style: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),),
        SizedBox(height: 10.h,),
        TextFormField(
          controller: TextEditingController(text: content),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: AppColors.greenColor,
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                color: AppColors.greenColor,
                width: 2.w,
              ),
            ),
          ),
          style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headlineMedium
          ),
        )
      ],
    );

  }
}
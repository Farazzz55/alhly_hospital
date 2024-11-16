import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Icon? editIcon;

  CustomTextFormField({
    required this.hintText,
    required this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.label,
    this.editIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: Colors.grey,
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.w,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.w,
            ),
          ),
          errorStyle: TextStyle(color: Colors.red),
          labelText: label,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 18.sp,
            color: Colors.grey,
          ),
        ),
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}

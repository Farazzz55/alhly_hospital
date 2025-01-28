import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Colors/app_colors.dart';

class SearchBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: AppColors.strokeColor
          ),
          borderRadius: BorderRadius.circular(15.r)
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w,),
          Icon(Icons.search,color: Colors.grey,size:35.w),
          SizedBox(width: 10.w,),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey,
                    fontWeight: FontWeight.normal),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                print("Search query: $value");
              },
            ),)                ],
      ),
    );

  }

}
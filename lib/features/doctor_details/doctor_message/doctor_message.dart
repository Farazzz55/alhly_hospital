import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorMessage extends StatelessWidget {
  static String routeName = 'DoctorMessage';


  @override
  Widget build(BuildContext context) {
    final  String? doctor = ModalRoute.of(context)!.settings.arguments as  String?;
    String name=doctor??'unKnown';

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/images/Doctor.png', width: 50.w, height: 50.h),
            SizedBox(width: 10.w),
            Text(
              'Dr. $doctor',
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text("Hello! How can I help you?"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text("I have a question", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    icon: Icon(Icons.send, color: AppColors.greenColor, size: 35.w,),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/core/widget/category_widget.dart';
import 'package:alhly_hospital/core/widget/chatbot_widget.dart';
import 'package:alhly_hospital/core/widget/doctor_widget.dart';
import 'package:alhly_hospital/core/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget{
  int selectedIndex = 0;

  static String routeName='HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        toolbarHeight: 198.h,
        backgroundColor: Colors.white,
        flexibleSpace: Image.asset(
          'assets/images/doctor-with-stethoscope-hands-hospital-background 1.png',
          fit: BoxFit.cover,
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hi',style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.headlineSmall
                    ),),
                    Text('User Name',style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.bodyMedium
                    ),)
                  ],
                ),
                Image.asset('assets/images/hospital_logo.png',height: 72.h,width: 72.w,),
              ],
            ),
            SizedBox(height: 10.h,),
            SearchBarWidget()
          ],
        ),

      ),

      body: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 10.h
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.bodyLarge
                  ),),
                  Text('View All',style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.bodySmall
                  ),),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryWidget(img: 'assets/images/Nephrology.png', title: 'Nephrology'),
                  CategoryWidget(img: 'assets/images/Dentistry.png', title: 'Dentistry'),
                  CategoryWidget(img: 'assets/images/Neurosurgery.png', title: 'Neurosurgery'),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Available Doctor',style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.bodyLarge
                  ),),
                  Text('View All',style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.bodySmall
                  ),),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DoctorWidget(drName: 'Sara Ahmed', specialist: 'Dentistry', yearsOfExperience: '8', numberOfPatients: '1.02K', img: 'assets/images/woman_doctor.png'),
                  DoctorWidget(drName: 'Sara Ahmed', specialist: 'Dentistry', yearsOfExperience: '8', numberOfPatients: '1.02K', img: 'assets/images/woman_doctor.png')
                ],
              ),
              SizedBox(height: 20.h,),
              ChatBotWidget(),


            ],
          ),
        ),
      ),

    );
  }

}
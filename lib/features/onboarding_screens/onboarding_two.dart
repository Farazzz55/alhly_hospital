import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingTwo extends StatelessWidget{
  static String routeName='OnBoardingTwo';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
       children: [
         SizedBox(height: 110.h,),
           Image.asset('assets/images/Doctors_logo.png',
           height: 198.h,
           width: 297.w,),
         SizedBox(height: 16.h,),
         Text('Book Your Appointment',style: GoogleFonts.inter(
           textStyle: Theme.of(context).textTheme.titleMedium
         ),),
         SizedBox(height: 16.h,),
         Text('Easily book appointments',style: GoogleFonts.inter(
             textStyle: Theme.of(context).textTheme.titleLarge
         ),),
         Text('with top specialists.',style: GoogleFonts.inter(
             textStyle: Theme.of(context).textTheme.titleLarge
         ),),
         
      
       ],
      ),
    );
  }
  
}
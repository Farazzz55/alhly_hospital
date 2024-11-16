import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingThree extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50.h,),
          Image.asset('assets/images/Insurance-logo.png',
            height: 307.h,
            width: 307.w,),
          SizedBox(height: 40.h,),
          Text('Schedule for Others',style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.titleMedium
          ),),
          SizedBox(height: 30.h,),
          Text('Schedule appointments for your',style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.titleLarge
          ),),
          Text(' loved ones with ease.',style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.titleLarge
          ),),


        ],
      ),
    );
  }

}
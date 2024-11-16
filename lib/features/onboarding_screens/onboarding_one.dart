import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingOne extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         SizedBox(height:75.h,),
         Image.asset('assets/images/chat_bot_logo.png',
         width: 290.w,
         height: 290.w,),
         SizedBox(height: 48.h,),
         Text('Smart Symptom Checker', style: GoogleFonts.inter(
           textStyle: Theme.of(context).textTheme.titleMedium
         ),),
         SizedBox(height: 30.h,),
         Text(
           'Describe your symptoms to our',
           style: GoogleFonts.inter(
             textStyle: Theme.of(context).textTheme.titleLarge,
             height: 1.5,
             letterSpacing: 0.5,
           ),
           textAlign: TextAlign.center,
         ),
         Text(
           'smart chatbot, and it will guide you ',
           style: GoogleFonts.inter(
             textStyle: Theme.of(context).textTheme.titleLarge,
             height: 1.5,
             letterSpacing: 0.5,
           ),
           textAlign: TextAlign.center,
         ),  Text(
           'to the right specialist.',
           style: GoogleFonts.inter(
             textStyle: Theme.of(context).textTheme.titleLarge,
             height: 1.5,
             letterSpacing: 0.5,
           ),
           textAlign: TextAlign.center,
         ),

       ],
     ),
   );
  }

}
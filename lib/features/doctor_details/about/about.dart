import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget{
  String name;
  String about;
  About({required this.name, required this.about});
  @override
  Widget build(BuildContext context) {
   return  Container(
     color: Colors.white,
     width: 343.w,
     height: 300.h,
     child: Padding(
       padding:  EdgeInsets.all(10.w),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('About Dr.  $name',style: GoogleFonts.inter(
               textStyle: Theme.of(context).textTheme.titleLarge
           ),),
           SizedBox(height: 10.h,),
           Expanded(
             child: Text(about,
               style: GoogleFonts.inter(
                   textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                     fontWeight: FontWeight.normal
                   )
               ),
               maxLines: 25,
               overflow: TextOverflow.ellipsis,),
           )
         ],
       ),
     ),
   );

  }

}
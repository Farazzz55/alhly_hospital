import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Colors/app_colors.dart';

class ChatBotWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.white,
        width: 350.w,
        height: 119.h,
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our smart chatbot is here to help!',
                    style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.greenColor,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Wrap(
                    children: [
                      Text(
                        'Simply describe your symptoms,\n'
                            'and the chatbot will guide you to \n'
                            'the right medical specialist.\n'
                            'Save time and get the care\n'
                            'you need, hassle-free!',
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/bot.png'),
                  Container(
                    width: 108.w,
                    height: 32.h,
                    color: Colors.transparent,
                    child: ElevatedButton(onPressed: (){}, child: Text(
                      'Ask The Bot' , style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.white
                      ),
                    ),
                    ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );

  }

}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/Colors/app_colors.dart';

class Clinics extends StatelessWidget{
  String hospitalLogo;
  String hospitalName;
  String address;
  String waitingTime;
  String fees;
  Clinics({required this.hospitalLogo, required this.hospitalName, required this.address, required this.waitingTime, required this.fees});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 343.w,
      height: 150.h ,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(hospitalLogo, width: 64.w, height: 64.h),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospitalName,
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      address,
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.watch_later_outlined, color: AppColors.greenColor,size: 40.w,),
              SizedBox(width: 5.w,),
              Column(
                children: [
                  Text('Waiting Time',style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.blackColor
                      )
                  ),),
                  SizedBox(height: 5.h,),
                  Text('$waitingTime Minutes',style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.blackColor
                      )
                  ),),

                ],
              ),
              SizedBox(width: 10.w,),
              Icon(Icons.attach_money, color: AppColors.greenColor, size: 40.w,),
              SizedBox(width: 5.w,),
              Column(
                children: [
                  Text('Fees',style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.blackColor
                      )
                  ),),
                  SizedBox(height: 5.h,),
                  Text('$fees EGP',style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.blackColor
                      )
                  ),),

                ],
              )

            ],
          ),

        ],
      ),

    );

  }
}
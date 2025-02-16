import 'package:alhly_hospital/core/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:intl/intl.dart';

import '../doctor_details/doctor_model/doctor_model.dart';

class ConfirmAppointment extends StatelessWidget {
  static String routeName = 'confirm_appointment';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args == null || args['doctor'] == null) {
      return Scaffold(body: Center(child: Text('Error: Missing appointment details')));
    }

    final DoctorModel doctor = args['doctor'];
    final DateTime bookDate = args['selectedDate'] ?? DateTime.now();
    final String bookTime = args['selectedTime'] ?? 'Unselected';

    String formattedDate = DateFormat.yMMMd().format(bookDate);
    String formattedTime = bookTime == 'Unselected' ? 'Not selected' : bookTime;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 276.h,
        title: Column(
          children: [
            Text(
              'Confirm your appointment',
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                CircleAvatar(
                  child: Image.asset(doctor.doctorImg,width: 56.w,
                  height: 56.h,),
                  backgroundColor: Colors.transparent,
                  radius: 30,
                ),
                Column(
                  children: [
                    Text(
                      'Dr. ${doctor.name}',
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Specialist of ${doctor.specialist}',
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.watch_later_outlined, color: AppColors.greenColor, size: 30.w),
                SizedBox(width: 5.w),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        'Waiting Time',
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '${doctor.waitingTime} Minutes',
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                              fontSize: 12.sp
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Icon(Icons.attach_money, color: AppColors.greenColor, size: 30.w),
                SizedBox(width: 5.w),
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        'Fees',
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                              fontSize: 12.sp
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '${doctor.fees} EGP',
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                              fontSize: 12.sp
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: EdgeInsets.all(20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.greyColor2,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'User Name',
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Mobile Number',
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.greyColor2,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '+201065006381',
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Booking Date',
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.greyColor2,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      formattedDate,
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Booking Time',
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.greyColor2,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      formattedTime,
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              ButtonWidget(buttonColor: AppColors.greenColor,
                  buttonText: 'Confirm',
                  textColor: AppColors.whiteColor,
                  onTap: (){

                  })
            ],
          ),
        ),
      ),
    );
  }
}

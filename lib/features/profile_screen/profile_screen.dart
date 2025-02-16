import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/features/login_screen/login_screen.dart';
import 'package:alhly_hospital/features/profile_screen/build_info_field.dart';
import 'package:alhly_hospital/features/profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = 'profile_screen';
  String  userName='User Name';
  String  mail='UserName@gmail.com';
  String  mobileNumber='1065006381';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200.h,
                  child: Image.asset(
                    'assets/images/doctor-with-stethoscope-hands-hospital-background 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.h,
                  left: 185.w,
                  child: Container(
                    width: 140.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: AppColors.greenColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit, size: 20.w, color: AppColors.greenColor),
                        SizedBox(width: 5.w),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(EditProfileScreen.routeName,
                            arguments: {
                              'name':userName,
                              'email':mail,
                              'mobileNumber':mobileNumber
                            });
                          },
                          child: Text(
                            'Edit Account',
                            style: GoogleFonts.inter(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(color: AppColors.greenColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 104.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60.w,
                      child: Icon(Icons.person, size: 50.w, color: AppColors.greenColor),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildInfoField( label: 'Name',value:userName),
                  SizedBox(height: 20.h),
                  BuildInfoField(label: 'Email', value: mail),
                  SizedBox(height: 20.h),
                  BuildInfoField( label: 'Mobile Number',value: mobileNumber),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, size: 35.w, color: AppColors.greenColor),
                      SizedBox(width: 5.w),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                        },
                        child: Text(
                          'Log Out',
                          style: GoogleFonts.inter(
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                          ),
                        ),
                      ),
                    ],
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

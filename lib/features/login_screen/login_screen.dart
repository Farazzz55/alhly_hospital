import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/core/widget/button.dart';
import 'package:alhly_hospital/core/widget/custom_text_from_field.dart';
import 'package:alhly_hospital/features/home_screen/home_screen.dart';
import 'package:alhly_hospital/features/main_screen/main_screen.dart';
import 'package:alhly_hospital/features/signUp_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/widget/app_validator.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 450.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/doctor-with-stethoscope-hands-hospital-background 1.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 50.h,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/hospital_logo.png',
                height: 150.h,
                width: 150.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 270.h),
              child: Container(
                height: 750.h,
                width: 375.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(130.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 70.h,),
                    Text('Login',style: GoogleFonts.dmSerifDisplay(
                      textStyle: Theme.of(context).textTheme.headlineLarge
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email',style: GoogleFonts.inter(
                            textStyle: Theme.of(context).textTheme.headlineMedium
                          ),),
                          SizedBox(height: 15.h,),
                          CustomTextFormField(hintText: 'Enter your email', validator:  (value){
                            return AppValidator.validateEmail(value);
                          },controller: emailController),
                          SizedBox(height: 15.h,),
                          Text('Password',style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.headlineMedium
                          ),),
                          CustomTextFormField(hintText: 'Enter your password', validator:  (value){
                            return AppValidator.validatePassword(value);
                          },controller: passwordController,obscureText: false,),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    ButtonWidget(buttonColor: AppColors.greenColor, buttonText: 'Login', textColor: AppColors.whiteColor, onTap: (){
                      Navigator.pushReplacementNamed(context, MainScreen.routeName);

                    }),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an account?',style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.titleLarge
                        ),) ,
                        SizedBox(width: 10.h,),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(SignUpScreen.routeName);
                          },
                          child: Text('SignUp',style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: AppColors.greenColor,
                                fontWeight: FontWeight.w700
                              )
                          ),),
                        ) ,

                      ],
                    )




                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

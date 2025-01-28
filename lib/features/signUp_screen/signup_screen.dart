import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/core/widget/button.dart';
import 'package:alhly_hospital/core/widget/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/widget/app_validator.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'SignUpScreen';
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
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
              padding: EdgeInsets.only(top: 220.h),
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
                    Text('SignUp',style: GoogleFonts.dmSerifDisplay(
                      textStyle: Theme.of(context).textTheme.headlineLarge
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('UserName',style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.headlineMedium
                          ),),
                          CustomTextFormField(hintText: 'Enter your username ', validator:  (value){
                            return AppValidator.validateUserName(value);
                          },controller: userNameController),
                          SizedBox(height: 15.h,),
                          Text('Email',style: GoogleFonts.inter(
                            textStyle: Theme.of(context).textTheme.headlineMedium
                          ),),
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
                          SizedBox(height: 15.h,),
                          Text('Confirm Password',style: GoogleFonts.inter(
                              textStyle: Theme.of(context).textTheme.headlineMedium
                          ),),
                          CustomTextFormField(hintText: 'ReEnter your password', validator:  (value){
                            return AppValidator.validateConfirmPassword(value,passwordController.text);
                          },controller: confirmPasswordController,obscureText: false,),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    ButtonWidget(buttonColor: AppColors.greenColor, buttonText: 'SignUp', textColor: AppColors.whiteColor, onTap: (){

                    }),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.titleLarge
                        ),) ,
                        SizedBox(width: 10.h,),
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);

                          },
                          child: Text('SignIn',style: GoogleFonts.inter(
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

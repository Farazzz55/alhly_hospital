import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetails extends StatelessWidget {
  static String routeName = 'doctor_details';

  @override
  Widget build(BuildContext context) {
    final Map<String, String?> doctor = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    String name = doctor['name'] ?? 'Unknown';
    String specialist = doctor['specialist'] ?? 'Unknown';
    String experience = doctor['yearsOfExperience'] ?? 'Unknown';
    String patients = doctor['numberOfPatients'] ?? 'Unknown';


    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 450.h,
        title: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/Doctor.png'), // yrg3ly swrt el doctor
                radius: 120,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 10.h,),
              Text('Dr. $name',style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.displayLarge
              ),),
              SizedBox(height: 10.h,),
              Text('Specialist of $specialist',style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontSize: 12.sp
                  ),
              ),),
              SizedBox(height: 10.h,),
              Icon(Icons.star,color: Colors.yellow,size: 20.w,),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Experience',style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 12.sp
              )),),
                      SizedBox(height: 10.h,),
                      Text('$experience Years',style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.displayMedium,))
                    ],
                  ),
                  Column(
                    children: [
                      Text('Number Of Patients',style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                              fontSize: 12.sp
                          )),),
                      SizedBox(height: 10.h,),
                      Text('$patients',style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.displayMedium,))
                    ],
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

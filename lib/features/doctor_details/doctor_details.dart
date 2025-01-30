import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/core/widget/button.dart';
import 'package:alhly_hospital/features/doctor_details/about/about.dart';
import 'package:alhly_hospital/features/doctor_details/button_style/button_style_widget.dart';
import 'package:alhly_hospital/features/doctor_details/doctor_message/doctor_message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'clinics/clinics.dart';

class DoctorDetails extends StatefulWidget {
  static String routeName = 'doctor_details';

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  int selectedIndex=0;

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
        toolbarHeight: 420.h,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonStyleWidget(title: 'Clinics',
                isSelected: selectedIndex==0,
                onPressed: (){
                  setState(() {
                    selectedIndex=0;
                  });
                },),
                ButtonStyleWidget(title: 'About',
                isSelected: selectedIndex==1,
                    onPressed: (){
                  setState(() {
                    selectedIndex=1;
                  });
                    },),
                ButtonStyleWidget(title: 'Message',
                isSelected: selectedIndex==2,
                    onPressed: (){
                  setState(() {
                    selectedIndex=2;
                  });
                    },)
              ],
            ),
            SizedBox(height: 20.h),
        selectedIndex == 0
            ? Clinics(
          hospitalLogo: 'assets/images/hospital_logo.png',
          hospitalName: 'Alahly hospital',
          address: '3 Dr. Burji, Abu Al-Nawatir, Sidi GaberDistrict, Alexandria',
          waitingTime: '10',
          fees: '200',
        )
            : selectedIndex == 1
            ? About(
          name: name,
          about: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
              'Lorem Ipsum has been the industry standard dummy text ever since the 1500s, '
              'when an unknown printer took a galley of type and scrambled it to make a type specimen book.'
              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
        )
            : Container(
          width: 343.w,
          height: 256.h ,
          color: Colors.white,
          child: Center(
            child: ButtonWidget(buttonColor: AppColors.greenColor, buttonText: 'Ask The Doctor', textColor: Colors.white, onTap: (){
              Navigator.of(context).pushNamed(DoctorMessage.routeName,
              arguments: name);
            }),
          ),


        )


        ],
        ),
      ),

    );
  }

}

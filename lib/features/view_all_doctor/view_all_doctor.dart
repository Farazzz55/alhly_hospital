import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/features/doctor_details/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/widget/doctor_widget.dart';

class ViewAllDoctor extends StatelessWidget{
  static String routeName='view_all_doctors';
  List<Map<String, String>> doctors = [
    {'name': 'Sara Ahmed', 'specialist': 'Nephrology', 'yearsOfExperience': '10', 'numberOfPatients': '500', 'img': 'assets/images/woman_doctor.png'},
    {'name': 'Jane Smith', 'specialist': 'Nephrology', 'yearsOfExperience': '8', 'numberOfPatients': '400', 'img': 'assets/images/woman_doctor.png'},
    {'name': 'Emily Davis', 'specialist': 'Nephrology', 'yearsOfExperience': '12', 'numberOfPatients': '600', 'img': 'assets/images/woman_doctor.png'},
    {'name': 'Michael Brown', 'specialist': 'Nephrology', 'yearsOfExperience': '5', 'numberOfPatients': '300', 'img': 'assets/images/woman_doctor.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70.h,
        title: Text('All Doctors', style: GoogleFonts.inter(
        textStyle: Theme.of(context).textTheme.bodyMedium,
    ),
      ),
        centerTitle: true,
    ),
            body: Padding(
            padding:  EdgeInsets.all(8.w),
            child: Column(
            children: [
            Expanded(
            child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 5.w,
            childAspectRatio: 0.88,  // Adjust as needed
            ),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(DoctorDetails.routeName,
                  arguments: doctors[index], // Pass the selected doctor
                );
              },
              child: DoctorWidget(
              drName: doctors[index]['name']!,
              specialist: doctors[index]['specialist']!,
              yearsOfExperience: doctors[index]['yearsOfExperience']!,
              numberOfPatients: doctors[index]['numberOfPatients']!,
              img: doctors[index]['img']!,),
            );},),),],
            ),),);
  }

}
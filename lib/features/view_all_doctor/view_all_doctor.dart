import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/features/doctor_details/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/widget/doctor_widget.dart';
import '../doctor_details/doctor_model/doctor_model.dart';

class ViewAllDoctor extends StatelessWidget {
  static String routeName = 'view_all_doctors';

  final List<DoctorModel> doctors = [
    DoctorModel(
      name: 'Sara Ahmed',
      specialist: 'Nephrology',
      yearsOfExperience: '10',
      numberOfPatients: '500',
      doctorImg: 'assets/images/Doctor.png',
      waitingTime: '10',
      fees: '200',
      availableTimes: ["09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM", "03:00 PM"]
    ),
    DoctorModel(
      name: 'Jane Smith',
      specialist: 'Nephrology',
      yearsOfExperience: '8',
      numberOfPatients: '400',
      doctorImg: 'assets/images/Doctor.png',
      waitingTime: '20',
      fees: '300',
      availableTimes: ["09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM", "03:00 PM"]

    ),
    DoctorModel(
      name: 'Emily Davis',
      specialist: 'Nephrology',
      yearsOfExperience: '12',
      numberOfPatients: '600',
      doctorImg: 'assets/images/Doctor.png',
      waitingTime: '30',
      fees: '400',
      availableTimes: ["09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM", "03:00 PM"]

    ),
    DoctorModel(
      name: 'Michael Brown',
      specialist: 'Nephrology',
      yearsOfExperience: '5',
      numberOfPatients: '300',
      doctorImg: 'assets/images/Doctor.png',
      waitingTime: '40',
      fees: '500',
      availableTimes: ["09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM", "03:00 PM"]

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70.h,
        title: Text(
          'All Doctors',
          style: GoogleFonts.inter(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 5.w,
            childAspectRatio: 0.88,
          ),
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  DoctorDetails.routeName,
                  arguments: doctors[index],
                );
              },
              child: DoctorWidget(
                drName: doctors[index].name,
                specialist: doctors[index].specialist,
                yearsOfExperience: doctors[index].yearsOfExperience,
                numberOfPatients: doctors[index].numberOfPatients,
                img: doctors[index].doctorImg,
              ),
            );
          },
        ),
      ),
    );
  }
}

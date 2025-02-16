import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/core/widget/category_widget.dart';
import 'package:alhly_hospital/core/widget/chatbot_widget.dart';
import 'package:alhly_hospital/core/widget/doctor_widget.dart';
import 'package:alhly_hospital/core/widget/search_bar_widget.dart';
import 'package:alhly_hospital/features/doctor_details/doctor_details.dart';
import 'package:alhly_hospital/features/doctor_details/doctor_model/doctor_model.dart';
import 'package:alhly_hospital/features/view_all_departments/view_all_departments.dart';
import 'package:alhly_hospital/features/view_all_doctor/view_all_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'HomeScreen';

  final List<Map<String, String>> doctors = [
    {'name': 'Sara Ahmed', 'specialist': 'Nephrology', 'yearsOfExperience': '10', 'numberOfPatients': '500', 'img': 'assets/images/Doctor.png'},
    {'name': 'Jane Smith', 'specialist': 'Nephrology', 'yearsOfExperience': '8', 'numberOfPatients': '400', 'img': 'assets/images/Doctor.png'},
    {'name': 'Emily Davis', 'specialist': 'Nephrology', 'yearsOfExperience': '12', 'numberOfPatients': '600', 'img': 'assets/images/Doctor.png'},
    {'name': 'Michael Brown', 'specialist': 'Nephrology', 'yearsOfExperience': '5', 'numberOfPatients': '300', 'img': 'assets/images/Doctor.png'},
  ];

  final List<Map<String, String>> departments = [
    {'name': 'Nephrology', 'img': 'assets/images/Nephrology.png'},
    {'name': 'Dentistry', 'img': 'assets/images/Dentistry.png'},
    {'name': 'Neurosurgery', 'img': 'assets/images/Neurosurgery.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        toolbarHeight: 198.h,
        backgroundColor: Colors.white,
        flexibleSpace: Image.asset(
          'assets/images/doctor-with-stethoscope-hands-hospital-background 1.png',
          fit: BoxFit.cover,
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi',
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Text(
                      'User Name',
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                Image.asset('assets/images/hospital_logo.png', height: 72.h, width: 72.w),
              ],
            ),
            SizedBox(height: 10.h),
            SearchBarWidget(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Departments',
                    style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.bodyLarge),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ViewAllDepartments.routeName);
                    },
                    child: Text(
                      'View All',
                      style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.bodySmall),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 100.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10.w
                  ),
                  itemCount: departments.length,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      img: departments[index]['img']!,
                      title: departments[index]['name']!,
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available Doctors',
                    style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.bodyLarge),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ViewAllDoctor.routeName);
                    },
                    child: Text(
                      'View All',
                      style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.bodySmall),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 200.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 5.w,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(DoctorDetails.routeName,
                        arguments: DoctorModel(
                          name: doctors[index]['name']??'null',
                          specialist:  doctors[index]['specialist']??'null',
                          yearsOfExperience: doctors[index]['yearsOfExperience']??'null',
                          numberOfPatients: doctors[index]['numberOfPatients']??'null',
                          waitingTime: '20',
                          fees: '200',
                          doctorImg: doctors[index]['img']??'',
                         availableTimes: ["09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM", "03:00 PM"],

                        ));
                      },
                      child: DoctorWidget(
                        drName: doctors[index]['name']!,
                        specialist: doctors[index]['specialist']!,
                        yearsOfExperience: doctors[index]['yearsOfExperience']!,
                        numberOfPatients: doctors[index]['numberOfPatients']!,
                        img: doctors[index]['img']!,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              ChatBotWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

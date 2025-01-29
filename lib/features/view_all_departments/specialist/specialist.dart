import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/core/widget/doctor_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Specialist extends StatelessWidget {
  static String routeName = 'specialist';

  @override
  Widget build(BuildContext context) {
    final Map<String, String?> args = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    String departmentTitle = args['name'] ?? 'Unknown Department';
    String departmentImage = args['icon'] ?? 'assets/images/bot.png';

    List<Map<String, String>> doctors = [
      {'name': 'Sara Ahmed', 'specialist': 'Nephrology', 'yearsOfExperience': '10', 'numberOfPatients': '500', 'img': 'assets/images/woman_doctor.png'},
      {'name': 'Jane Smith', 'specialist': 'Nephrology', 'yearsOfExperience': '8', 'numberOfPatients': '400', 'img': 'assets/images/woman_doctor.png'},
      {'name': 'Emily Davis', 'specialist': 'Nephrology', 'yearsOfExperience': '12', 'numberOfPatients': '600', 'img': 'assets/images/woman_doctor.png'},
      {'name': 'Michael Brown', 'specialist': 'Nephrology', 'yearsOfExperience': '5', 'numberOfPatients': '300', 'img': 'assets/images/woman_doctor.png'},
    ];

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70.h,
        title: Row(
          children: [
            Image.asset(departmentImage),
            SizedBox(width: 10.w),
            Text(
              departmentTitle,
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
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
                  return DoctorWidget(
                    drName: doctors[index]['name']!,
                    specialist: doctors[index]['specialist']!,
                    yearsOfExperience: doctors[index]['yearsOfExperience']!,
                    numberOfPatients: doctors[index]['numberOfPatients']!,
                    img: doctors[index]['img']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

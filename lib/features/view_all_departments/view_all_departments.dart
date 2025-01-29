import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/features/view_all_departments/department_item/department_item.dart';
import 'package:alhly_hospital/features/view_all_departments/specialist/specialist.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewAllDepartments extends StatelessWidget{
  static String routeName='view_all_departments';
   List<Map<String, String>> departments = [
    {'icon': 'assets/images/Nephrology.png', 'name': 'Nephrology'},
    {'icon': 'assets/images/Dentistry.png', 'name': 'Dentistry'},
    {'icon': 'assets/images/Neurosurgery.png', 'name': 'Neurosurgery'},
    {'icon': 'assets/images/Audiology.png', 'name': 'Audiology'},
    {'icon': 'assets/images/Dermatology.png', 'name': 'Dermatology',},
    {'icon': 'assets/images/Geriatrics.png', 'name': 'Geriatrics',},
    {'icon': 'assets/images/Opthalmology.png', 'name': 'Ophthalmology',},
   ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: AppColors.bgColor,
    appBar: AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 70.h,
      title: Text('All Departments', style: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.bodyMedium,
    ),
    ),
      centerTitle: true,
   ),
     body: Column(
       children: [
         Expanded(
           child: ListView.builder(
             itemCount: departments.length,
             itemBuilder: (context, index) {
               return InkWell(
                 onTap: (){
                   Navigator.of(context).pushNamed(Specialist.routeName,
                   arguments: {
                     'name': departments[index]['name'],
                     'icon': departments[index]['icon'],
                   },);
                 },
                 child: DepartmentItem(
                     imgPath: departments[index]['icon']!,
                     title: departments[index]['name']!),
               );
             },
           ),
         ),
       ],
     ),
);
  }

}
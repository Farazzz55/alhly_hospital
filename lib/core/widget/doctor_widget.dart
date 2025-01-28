import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorWidget extends StatelessWidget{
  String drName;
  String specialist;
  String yearsOfExperience;
  String numberOfPatients;
  String img;
  DoctorWidget({required this.drName, required this.specialist, required this.yearsOfExperience,
  required this.numberOfPatients , required this.img});
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      width: 148.w,
      height: 200.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 15.h,
                  left: 5.w,
                  right: 5.w,
                  bottom: 5.h
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dr. $drName',
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.displayMedium,
                        )),
                    SizedBox(height: 5.h),
                    Text('Specialist of $specialist',
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                        )),
                    SizedBox(height: 5.h),
                    Icon(Icons.star, color: Colors.yellow, size: 18),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Experience',
                                style: GoogleFonts.inter(
                                  textStyle:
                                  Theme.of(context).textTheme.displaySmall,
                                )),
                            SizedBox(height: 5.h),
                            Text('$yearsOfExperience Years',
                                style: GoogleFonts.inter(
                                  textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                                )),
                            SizedBox(height: 5.h),
                            Text('Patients',
                                style: GoogleFonts.inter(
                                  textStyle:
                                  Theme.of(context).textTheme.displaySmall,
                                )),
                            SizedBox(height: 5.h),
                            Text('$numberOfPatients',
                                style: GoogleFonts.inter(
                                  textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                                )),
                          ],
                        ),
                        Image.asset(img,width: 91.w,
                          height: 128.h,)
                      ],
                    ),

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
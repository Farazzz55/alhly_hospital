import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/core/widget/button.dart';
import 'package:alhly_hospital/features/book_an_appointment/confirm_appointment.dart';

import '../doctor_details/doctor_model/doctor_model.dart';

class BookAnAppointment extends StatefulWidget {
  static String routeName = 'book_an_appointment';

  @override
  _BookAnAppointmentState createState() => _BookAnAppointmentState();
}

class _BookAnAppointmentState extends State<BookAnAppointment> {
  DateTime? selectedDate;
  String? selectedTime;
  late DoctorModel doctor;



  @override
  Widget build(BuildContext context) {
    final doctorModel = ModalRoute.of(context)?.settings.arguments as DoctorModel?;
    if (doctorModel == null) {
      return Scaffold(
        body: Center(child: Text('Error: No doctor data found')),
      );
    }
    doctor = doctorModel;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Book Appointment', style: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.bodyMedium,
        )),
        centerTitle: true,
        toolbarHeight: 150.h,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text("Select Date", style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              )),
              SizedBox(height: 10.h),
              Center(
                child: ButtonWidget(
                  buttonColor: AppColors.greenColor,
                  buttonText: selectedDate == null ? "Choose Date" : "${selectedDate!.toLocal()}".split(' ')[0],
                  textColor: Colors.white,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            primaryColor: Colors.green,
                            hintColor: Colors.green,
                            colorScheme: ColorScheme.light(primary: Colors.green),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (pickedDate != null) {
                      setState(() => selectedDate = pickedDate);
                    }
                  },
                ),
              ),
              SizedBox(height: 25.h),
              Text("Select Time", style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              )),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: doctor.availableTimes.map((time) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                  child: Container(
                    width: 90.w,
                    height: 40.h,
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: selectedTime == time ? AppColors.greenColor : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        time,
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: selectedTime == time ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )).toList(),
              ),
              SizedBox(height: 50.h),
              Center(
                child: ButtonWidget(
                  buttonColor: AppColors.greenColor,
                  buttonText: 'Confirm Appointment',
                  textColor: Colors.white,
                  onTap: bookAppointment,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  void bookAppointment() {
    if (selectedDate == null || selectedTime == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Please select a date and time.',style:GoogleFonts.inter(),),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK',style: GoogleFonts.inter(
                color: AppColors.greenColor,
                fontWeight: FontWeight.w700
              ),),
            ),
          ],
        ),
      );
      return;
    }

    Navigator.of(context).pushNamed(
      ConfirmAppointment.routeName,
      arguments: {
        'doctor': doctor,
        'selectedDate': selectedDate,
        'selectedTime': selectedTime,
      },
    );
  }

}

import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/core/widget/button.dart';
import 'package:alhly_hospital/features/book_an_appointment/confirm_appointment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAnAppointment extends StatefulWidget {
  static String routeName='book_an_appointment';
  @override
  _BookAnAppointmentState createState() => _BookAnAppointmentState();
}

class _BookAnAppointmentState extends State<BookAnAppointment> {
  DateTime? selectedDate;
  String? selectedTime;

  final List<String> availableTimes = [
    "09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM", "02:00 PM", "03:00 PM"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Book Appointment',style: GoogleFonts.inter(
          textStyle: Theme.of(context).textTheme.bodyMedium
      ),),
      centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Text("Select Date", style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700
                )
              )),
              SizedBox(height: 10.h),
              Center(
                child: ButtonWidget(buttonColor: AppColors.greenColor,
                    buttonText: selectedDate == null ? "Choose Date" : "${selectedDate!.toLocal()}".split(' ')[0],
                    textColor: Colors.white, onTap: ()
                      async {
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
                                buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.green,
                                  ),
                                ),
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
                      fontWeight: FontWeight.w700
                  )
              )),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: availableTimes.map((time) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = selectedTime == time ? null : time;
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
                    child: Text(
                      time,
                      style: GoogleFonts.inter(
                        textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: selectedTime == time ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                )).toList(),
              ),
              SizedBox(height: 50.h),
              Center(
                child: Column(
                  children: [
                    ButtonWidget(buttonColor: AppColors.greenColor,
                        buttonText: 'Confirm Appointment',
                        textColor: Colors.white, onTap: (){
                          bookAppointment();
                        }),
                    SizedBox(height: 10.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void bookAppointment() {
      Navigator.of(context).pushNamed(ConfirmAppointment.routeName,
      arguments: {
        'selectedDate': selectedDate,
        'selectedTime': selectedTime
      },);


  }

  // void cancelAppointment() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: AppColors.bgColor,
  //         content: Text("Do you really want to cancel the appointment?",
  //         style: GoogleFonts.inter(
  //                 textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
  //                   color: Colors.black
  //                 ))
  //         ,),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text("No",  style: GoogleFonts.inter(
  //       textStyle: Theme.of(context).textTheme.labelMedium) ),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               setState(() {
  //                 selectedDate = null;
  //                 selectedTime = null;
  //               });
  //               Navigator.of(context).pop();
  //             },
  //             child: Text("Yes",style: GoogleFonts.inter(
  //                 textStyle: Theme.of(context).textTheme.labelMedium) ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

}




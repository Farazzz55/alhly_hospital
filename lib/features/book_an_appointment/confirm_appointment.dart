import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/Colors/app_colors.dart';

class ConfirmAppointment extends StatelessWidget {
  static String routeName = 'confirm_appointment';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    DateTime? selectedDate = arguments?['selectedDate'] as DateTime?;
    String? selectedTime = arguments?['selectedTime'] as String?;


    DateTime bookDate = selectedDate ?? DateTime.now();
    String bookTime = selectedTime ?? 'Unselected';

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Confirm your appointment',
          style: GoogleFonts.inter(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

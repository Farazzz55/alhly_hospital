import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class ButtonWidget extends StatelessWidget{
  Color buttonColor;
  String buttonText;
  Color textColor;
  void Function() onTap;
  ButtonWidget({required this.buttonColor,required this.buttonText,required this.textColor,
  required this.onTap});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 58.h,
      width: 329.w,
      child: ElevatedButton(onPressed:onTap, child: Text(buttonText,
        style: GoogleFonts.inter(
            textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
              color:textColor
            )
        ),),
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight:Radius.circular(10.r),
                    topLeft:Radius.circular(10.r) ,
                    bottomLeft: Radius.circular(10.r),
                    bottomRight:Radius.circular(10.r)
                )
            )
        ),
      ),
    );
  }

}
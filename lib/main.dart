import 'package:alhly_hospital/core/Theme/my_app_theme.dart';
import 'package:alhly_hospital/features/chat_bot_screen/chat_bot_screen.dart';
import 'package:alhly_hospital/features/login_screen/login_screen.dart';
import 'package:alhly_hospital/features/main_screen/main_screen.dart';
import 'package:alhly_hospital/features/signUp_screen/signup_screen.dart';
import 'package:alhly_hospital/features/splash_screen/animated_spalsh/animated_splash.dart';
import 'package:alhly_hospital/features/view_all_departments/specialist/specialist.dart';
import 'package:alhly_hospital/features/view_all_departments/view_all_departments.dart';
import 'package:alhly_hospital/features/view_all_doctor/view_all_doctor.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/onboarding_screens/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(),
  ),

);}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (context , child )=> MaterialApp(
       debugShowCheckedModeBanner: false,
        initialRoute: AnimatedSplash.routeName,
        routes: {
         AnimatedSplash.routeName : (context)=> AnimatedSplash(),
          OnBoarding.routeName :(context) =>OnBoarding(),
          LoginScreen.routeName :(context)=> LoginScreen(),
          SignUpScreen.routeName : (context)=>SignUpScreen(),
          MainScreen.routeName:(context)=>MainScreen(),
          ChatBotScreen.routeName:(context)=>ChatBotScreen(),
          ViewAllDepartments.routeName:(context)=>ViewAllDepartments(),
          Specialist.routeName:(context)=>Specialist(),
          ViewAllDoctor.routeName:(context)=>ViewAllDoctor()
        },
       theme: MyAppTheme.lightTheme,
      ),
    );
  }
}



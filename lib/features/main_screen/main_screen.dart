import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:alhly_hospital/features/appointment_screen/appointment_screen.dart';
import 'package:alhly_hospital/features/home_screen/home_screen.dart';
import 'package:alhly_hospital/features/messages_screen/message_screen.dart';
import 'package:alhly_hospital/features/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static String routeName = 'main_screen';

  @override
  State<MainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeScreen(),
    AppointmentScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: Container(
          height: 100.h,
          padding: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 25.w,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_today,
                  size: 25.w,
                ),
                label: 'Appointment',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.message_outlined,
                  size: 25.w,
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_sharp,
                  size: 25.w,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
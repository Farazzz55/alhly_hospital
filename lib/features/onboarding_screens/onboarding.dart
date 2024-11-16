import 'package:alhly_hospital/core/Colors/app_colors.dart';
import 'package:alhly_hospital/core/widget/button.dart';
import 'package:alhly_hospital/features/onboarding_screens/onboarding_one.dart';
import 'package:alhly_hospital/features/onboarding_screens/onboarding_two.dart';
import 'package:alhly_hospital/features/onboarding_screens/onboarding_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  static String routeName = 'OnBoarding';

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<Widget> pages = [OnBoardingOne(), OnBoardingTwo(), OnBoardingThree()];
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              pageController.jumpToPage(pages.length - 1);
            },
            child: Text(
              'Skip',
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SizedBox(width: 15.w),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(), // Disables swiping
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) => pages[index],
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: pages.length,
            effect: JumpingDotEffect(
              activeDotColor: AppColors.greenColor,
              dotColor: AppColors.greyColor,
              jumpScale: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.h),
            child: Column(
              children: [
                if (currentPage == 1||currentPage==2)
                  ButtonWidget(
                    buttonColor: AppColors.greyColor,
                    buttonText: 'Back',
                    textColor: AppColors.greenColor,
                    onTap: () {
                      pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                  ),

                SizedBox(height: 15.h),
                if (currentPage == 1 || currentPage == 0)
                  ButtonWidget(
                    buttonColor: AppColors.greenColor,
                    buttonText: currentPage == 1 ? 'Next' : 'Next',
                    textColor: AppColors.whiteColor,
                    onTap: () {
                      if (currentPage == pages.length - 1) {
                        Navigator.of(context).pushReplacementNamed('/mainScreen');
                      } else {
                        pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                  ),
                if (currentPage == 2)
                  ButtonWidget(
                    buttonColor: AppColors.greenColor,
                    buttonText: 'Get Started',
                    textColor: AppColors.whiteColor,
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/mainScreen');
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

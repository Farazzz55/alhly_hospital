import 'package:flutter/material.dart';

import '../../onboarding_screens/onboarding.dart';

class AnimatedSplash extends StatefulWidget {
  static String routeName = 'AnimatedSplash';

  @override
  _AnimatedSplashState createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Animation duration for fade-out
      vsync: this,
    );

    // Define the opacity animation
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start fading out the splash screen
    _controller.forward();

    // Wait for 5 seconds before navigating to another screen
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, OnBoarding.routeName);
    });
  }

  @override
  void dispose() {
    // Dispose of the controller to free resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,

            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/hospital_logo.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

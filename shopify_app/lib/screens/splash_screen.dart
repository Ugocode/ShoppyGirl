import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_app/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Timer for the delay of our screen
  Timer? _timer;

  _getDelay() {
    _timer = Timer(const Duration(seconds: 5), _goToNext);
  }

  _goToNext() {
    Get.offAll(() => const OnBoardingScreen());
  }

  @override
  void initState() {
    super.initState();
    _getDelay();
  }

//dispose off the timer
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SizedBox(
        child: Center(
          child: AnimatedContainer(
            curve: Curves.bounceInOut,
            duration: const Duration(seconds: 10),
            child: const Image(
              image: AssetImage("assets/images/logo.png"),
              height: 100,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}

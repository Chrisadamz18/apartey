import 'dart:async';
import 'package:apartey/admin/edited_home.dart';
import 'package:apartey/admin/homeScreen.dart';
import 'package:apartey/pages/profile.dart';

import '/screen/onboardscreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        // Call the Onboarding screen here
        context,
        MaterialPageRoute(builder: (context) => mainHome()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white54,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.3,
                  child:
                      Image.asset('assets/images/yooo.jpg', fit: BoxFit.cover),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

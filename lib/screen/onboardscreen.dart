import 'dart:ui';



import 'package:apartey/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboardScreen extends StatefulWidget {
  // const onboardScreen({Key? key}) : super(key: key);

  @override
  State<onboardScreen> createState() => _onboardScreenState();
}

class _onboardScreenState extends State<onboardScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: Image.asset(
                urlImage,
                fit: BoxFit.contain,
                // width: double.infinity,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Center(
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.5,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              buildPage(
                  color: Colors.white30,
                  urlImage: 'assets/images/poo9.png',
                  title: 'Get Accommodation in  a Minute ',
                  subtitle:
                      'Rent your expected apartment with just a click with Apartey '),
              buildPage(
                  color: Colors.white30,
                  urlImage: 'assets/images/poo4.png',
                  title: 'Always 100% Verified ',
                  subtitle:
                      'All the properties are well verified. No fraud, No 3rd party. Fully secure and protected'),
              buildPage(
                  color: Colors.white30,
                  urlImage: 'assets/images/paa5.png',
                  title: 'Reduced Search Cost ',
                  subtitle:
                      'We care a lot about your budget that is why we give you the best view of the apartment without you going through the usual stress'),
            ],
          ),
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                primary: Colors.white,
                backgroundColor: Colors.blueGrey,
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 24),
              ),
            )
          : Container(
              color: Colors.blueGrey,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.jumpToPage(2),
                    child: const Text(
                      'SKIP',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.white),
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

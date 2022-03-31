import '/screen/splash.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'model/notifier/apartment_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // final prefs = await SharedPreferences.getInstance();
  // final showHome = prefs.getBool('showHome') ?? false;
// showHome: showHome
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final bool showHome;
  // const MyApp({Key? key, required this.showHome}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apartey',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      // use for the home page
      // showHome ? HomePage() :
      home: const SplashScreen(),
    );
  }
}

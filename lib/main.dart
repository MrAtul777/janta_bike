import 'package:flutter/material.dart';
import 'package:janta_bike/form/car.dart';
import 'package:janta_bike/form/login.dart';
import 'package:janta_bike/form/two_wheel.dart';
import 'package:janta_bike/page/Seller.dart';
import 'package:janta_bike/page/navbar.dart';
import 'package:janta_bike/splashscreen.dart';
import 'package:janta_bike/welcome/welcome.dart';
import 'myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/home':(context)=>Navbar()

          // Replace HomePage with your actual home page      },

        }
    );
  }

}
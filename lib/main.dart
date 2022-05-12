import 'package:flutter/material.dart';
import 'package:moovbe/dashBoardScreen.dart';
import 'package:moovbe/driverScreen.dart';
import 'package:moovbe/loginScreen.dart';
import 'package:moovbe/splashScreen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      routes: {
        '/loginScreen': (context) => LoginScreen(),
        '/driverScreen': (context) => DriverScreen(),
        '/dashBoardScreen': (context) => DashBoard(),
      },
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

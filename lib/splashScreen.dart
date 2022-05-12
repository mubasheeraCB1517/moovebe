import 'package:flutter/material.dart';
import 'package:moovbe/constants.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset("assets/images/moovbe.png"),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 30,
              left: 30,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed("/loginScreen");
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

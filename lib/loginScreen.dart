import 'package:flutter/material.dart';
import 'package:moovbe/constants.dart';
import 'package:moovbe/dashBoardScreen.dart';
import 'package:moovbe/repositories/loginRepository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _validate = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Stack(
          children: [
            Container(
                color: Colors.black,
                child: ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: primaryColor,
                  ),
                  clipper: CustomClipPath(),
                )),
            Container(
              margin: EdgeInsets.only(top: 150, left: 20),
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 180, left: 20),
              child: Text(
                "Manage Your Bus and Drivers",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 250),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              margin: EdgeInsets.only(top: 260, right: 20, left: 20),
              decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.blueAccent)
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]),
              child: Center(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: userNameController,
                  validator: (value) {
                    if (value != "admin_user") {
                      return 'Incorrect Username';
                    }
                    // if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                    //   return 'Please a valid Email';
                    // }
                    return null;
                  },
                  onSaved: (value) {
                    userNameController = value as TextEditingController;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter Username",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              margin: EdgeInsets.only(top: 340, right: 20, left: 20),
              decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.blueAccent)
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]),
              child: Center(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: passWordController,
                  validator: (value) {
                    if (value != "123admin789") {
                      return 'Incorrect Password';
                    }
                    // if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                    //   return 'Please a valid Email';
                    // }
                    return null;
                  },
                  onSaved: (value) {
                    userNameController = value as TextEditingController;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_key.currentState!.validate()) {
                    print("Form was Submitted Successfully");
                    userNameController.text.isEmpty
                        ? _validate = true
                        : _validate = false;
                    passWordController.text.isEmpty
                        ? _validatePassword = true
                        : _validatePassword = false;
                  }
                });
                LoginRepository()
                    .login(userNameController.text, passWordController.text)
                    .then((value) {
                  if (value["status"] == true) {
                    apiKey = value["url_id"];
                    token = value["access"];

                    Navigator.of(context).popAndPushNamed("/dashBoardScreen");
                  }
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height - 90,
                    left: 20,
                    right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor),
                child: Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(400, 0);
    path.lineTo(400, 130);
    path.lineTo(250, 250);
    path.lineTo(100, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

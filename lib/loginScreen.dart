

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              Container(
                  color: Colors.black,
                  child: ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: primaryColor,
                    ),
                    clipper: CustomClipPath(),
                  )
              ),
              Container(
                margin:EdgeInsets.only(top: 150,left: 20) ,
                child: Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),),
              ),
              Container(
                margin:EdgeInsets.only(top: 180,left: 20) ,
                child: Text("Manage Your Bus and Drivers",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 18),),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 250),

              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                margin: EdgeInsets.only(top: 300,right: 20,left: 20),
                decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.blueAccent)
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]
                ),
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.center ,
                    decoration: InputDecoration(
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
                height: 70,
                margin: EdgeInsets.only(top: 390,right: 20,left: 20),
                decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.blueAccent)
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]
                ),
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.center ,
                    decoration: InputDecoration(
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
                onTap: (){
                  LoginRepository().login().then((value) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => DashBoard()));
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 110,left: 20,right: 20 ),

                  decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.blueAccent)
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor),

                  child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),textAlign: TextAlign.center,)),
                ),
              ),
            ],
          ),



    );
  }
}
class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(400, 0);
    path.lineTo(400,130);
    path.lineTo(250,250);
    path.lineTo(100, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
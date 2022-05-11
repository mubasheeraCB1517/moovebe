import 'package:flutter/material.dart';
import 'package:moovbe/constants.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: SizedBox(
          height: 0,
        ),
        title: Container(
            height: 20, child: Image.asset("assets/images/moovbe.png")),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 20),
                      child: Text("Bus",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                          color: Colors.white
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40,left: 20),
                      child: Text("Manage Your Bus",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.white
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60,left: 50,bottom: 10),
                      child: Image.asset("assets/images/bus.png")
                    )
                  ],
                ),
              )),

              Expanded(child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 20),
                      child: Text("Driver",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40,left: 20,),
                      child: Text("Manage Your Driver",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.white
                      ),),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 60,left: 50,bottom: 10),
                        child: Image.asset("assets/images/bus.png")
                    )
                  ],
                ),
              ))
            ],
          )
          ],
        ),
      ),
    );
  }
}

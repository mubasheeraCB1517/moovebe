import 'package:flutter/material.dart';
import 'package:moovbe/constants.dart';
import 'package:moovbe/repositories/driverSaveRepository.dart';
class DriverSave extends StatefulWidget {
  const DriverSave({Key? key}) : super(key: key);

  @override
  State<DriverSave> createState() => _DriverSaveState();
}

class _DriverSaveState extends State<DriverSave> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Add Driver",style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: Stack(
          children: [
        Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        margin: EdgeInsets.only(top: 50,right: 20,left: 20),
        decoration: BoxDecoration(
          //   border: Border.all(color: Colors.blueAccent)
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300]
        ),
        child: Center(
          child: TextField(
            controller: nameController,
            textAlign: TextAlign.center ,
            decoration: InputDecoration(
              hintText: "Enter Name",
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
              margin: EdgeInsets.only(top: 130,right: 20,left: 20),
              decoration: BoxDecoration(
                //   border: Border.all(color: Colors.blueAccent)
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]
              ),
              child: Center(
                child: TextField(
                  controller: mobileController,
                  textAlign: TextAlign.center ,
                  decoration: InputDecoration(
                    hintText: "Enter Mobile Number",
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
        margin: EdgeInsets.only(top: 210,right: 20,left: 20),
        decoration: BoxDecoration(
          //   border: Border.all(color: Colors.blueAccent)
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300]
        ),
        child: Center(
          child: TextField(
            controller: licenseController,
            textAlign: TextAlign.center ,
            decoration: InputDecoration(
              hintText: "Enter License Number",
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
                DriverSaveRepository().driverSave(nameController.text, mobileController.text, licenseController.text,context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 170,left: 20,right: 20 ),

                decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.blueAccent)
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor),

                child: Center(child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),textAlign: TextAlign.center,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moovbe/Bloc/driverListBloc.dart';
import 'package:moovbe/Models/driverListModel.dart';
import 'package:moovbe/Network/response.dart';
import 'package:moovbe/driverSaveScreen.dart';
import 'package:moovbe/repositories/driverDeleteRepository.dart';

import 'constants.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  late DriverList drivers;
  late DriverListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = DriverListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "Driver List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: StreamBuilder<Response<DriverList>>(
            stream: _bloc.driverListDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(color: primaryColor,),
                      ),
                    ); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                    break;
                  case Status.SUCCESS:
                    drivers = snapshot.data!.data;
                    return Container(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Text(
                              "${drivers.driver_list?.length ?? 0} Drivers Found",
                              style: TextStyle(color: Colors.black45),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40, bottom: 130),
                            // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                            child: ListView.builder(
                                itemCount: drivers.driver_list?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: Offset(1,
                                                1), // changes position of shadow
                                          ),
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 80,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 20),
                                          color: Colors.grey[100],
                                          child: CircleAvatar(
                                            radius: 16.0,
                                            child: ClipRRect(
                                              child: Image.asset(
                                                  'assets/images/profile.jpeg'),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                          ),
                                        ),
                                        // Image.asset("assets/images/profile.jpeg",fit: BoxFit.fill,)),

                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(drivers.driver_list?[index]
                                                      .name ??
                                                  ""),
                                              Text(drivers.driver_list?[index]
                                                      .license_no ??
                                                  ""),
                                            ]),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            DriverDeleteRepository().driverDelete(drivers.driver_list?[index].id.toString(), context);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                                child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DriverSave()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 110,left: 20,right: 20 ),

                                decoration: BoxDecoration(
                                    //   border: Border.all(color: Colors.blueAccent)
                                    borderRadius: BorderRadius.circular(10),
                                    color: primaryColor),

                                child: Center(
                                    child: Text(
                                  "Add Driver",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  case Status.ERROR:
                    return Container(
                      color: Colors.yellow,
                    );
                }
              }
              return Container(
                color: Colors.black45,
              );
            }));
  }
}

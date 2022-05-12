import 'package:flutter/material.dart';
import 'package:moovbe/Bloc/busListBloc.dart';
import 'package:moovbe/Models/busListModel.dart';
import 'package:moovbe/Network/response.dart';
import 'package:moovbe/busSeatLayout.dart';
import 'package:moovbe/constants.dart';
import 'package:moovbe/driverScreen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late BusList buses;
  late BusListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BusListBloc();

  }

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
        body: StreamBuilder<Response<BusList>>(
            stream: _bloc.busListDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Container(); // LoadingScreen(loadingMessage: "Fetching", loadingColor: kPrimaryColor,);
                    break;
                  case Status.SUCCESS:
                    buses = snapshot.data!.data;
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: GestureDetector(

                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20, left: 20),
                                        child: Text(
                                          "Bus",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 45, left: 20),
                                        child: Text(
                                          "Manage Your Bus",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 75, left: 50, bottom: 10),
                                          child: Image.asset(
                                            "assets/images/bus.png",
                                            fit: BoxFit.fill,
                                            scale: 0.5,
                                          ))
                                    ],
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DriverScreen()));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 20, left: 20),
                                        child: Text(
                                          "Driver",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 45,
                                          left: 20,
                                        ),
                                        child: Text(
                                          "Manage Your Driver",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 65, left: 50),
                                          child: Image.asset(
                                            "assets/images/driver.png",
                                            scale: 0.94,
                                          ))
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "${buses.bus_list?.length ?? 0} Buses Found",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 400,
                              child: ListView.builder(
                                  itemCount: buses.bus_list?.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: Offset(1,
                                                  1), // changes position of shadow
                                            ),
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: 80,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 20),
                                              color: Colors.grey[100],
                                              child: Image.asset(
                                                "assets/images/busImage.png",
                                                fit: BoxFit.fill,
                                              )),


                                                Container(
                                                  width: 150,
                                                    child: Text(buses.bus_list?[index].name ?? "",maxLines: 1,overflow: TextOverflow.ellipsis,)),



                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => BusSeatLayOut(layout: buses.bus_list?[index].seat_count,)));
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
                                                "Manage",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                          SizedBox(width: 10,)
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    );
                  case Status.ERROR:
                    return Container();
                }
              }
              return Container();
            }

            ));
  }
}

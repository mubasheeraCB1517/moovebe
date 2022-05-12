import 'package:flutter/material.dart';
import 'package:moovbe/Bloc/driverListBloc.dart';
import 'package:moovbe/Models/driverListModel.dart';
import 'package:moovbe/Network/response.dart';
import 'package:moovbe/constants.dart';

class BusSeatLayOut extends StatefulWidget {
  const BusSeatLayOut({Key? key, required this.layout, this.busName})
      : super(key: key);
  final String? layout;
  final String? busName;

  @override
  State<BusSeatLayOut> createState() => _BusSeatLayOutState();
}

class _BusSeatLayOutState extends State<BusSeatLayOut> {
  late DriverList drivers;
  late DriverListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = DriverListBloc();
  }

  @override
  var _chairStatus = [
    [2, 2, 2, 2, 3, 2],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            widget.busName!,
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
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                    );
                    break;
                  case Status.SUCCESS:
                    drivers = snapshot.data!.data;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      drivers.driver_list?[0].name ?? "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "License no:${drivers.driver_list?[0].license_no ?? ""}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                Container(
                                    child: Image.asset(
                                  "assets/images/driver.png",
                                  scale: 0.5,
                                ))
                              ],
                            ),
                          ),
                          Container(
                            height: 500,
                            margin: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black12)),
                            child: Column(
                              children: <Widget>[
                                for (int i = 0; i < 11; i++)
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: i == 0 ? 20 : 0,
                                        bottom: i == 0 ? 10 : 0),
                                    child: Row(
                                      children: <Widget>[
                                        for (int x = 1; x < 6; x++)
                                          Expanded(
                                            child: widget.layout == "1x3"
                                                ? (x == 3)
                                                    ? Container()
                                                    : Container(
                                                        margin:
                                                            EdgeInsets.all(0),
                                                        child: _chairStatus[i]
                                                                    [x - 1] ==
                                                                1
                                                            ? availableChair(
                                                                i, x - 1)
                                                            : _chairStatus[i][x -
                                                                        1] ==
                                                                    2
                                                                ? selectedChair(
                                                                    i, x - 1)
                                                                : reservedChair(),
                                                      )
                                                : (x == 2)
                                                    ? Container()
                                                    : Container(
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        child: _chairStatus[i]
                                                                    [x - 1] ==
                                                                1
                                                            ? availableChair(
                                                                i, x - 1)
                                                            : _chairStatus[i][x -
                                                                        1] ==
                                                                    2
                                                                ? selectedChair(
                                                                    i, x - 1)
                                                                : reservedChair(),
                                                      ),
                                          ),
                                      ],
                                    ),
                                  ),
                              ],
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

  Widget selectedChair(int a, int b) {
    return InkWell(
        onTap: () {
          // _chairStatus[a][b] = 1;
          setState(() {});
        },
        child: Container());
  }

  Widget availableChair(int a, int b) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        height: 30.0,
        width: 10.0,
        child: Image.asset("assets/images/busSeat.png"),
      ),
    );
  }

  Widget reservedChair() {
    return Container(
      height: 30.0,
      width: 10.0,
      child: Image.asset("assets/images/blackBusSeat.png"),
    );
  }
}

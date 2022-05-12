import 'package:flutter/material.dart';
class BusSeatLayOut extends StatefulWidget {
  const BusSeatLayOut({Key? key, required this.layout}) : super(key: key);
final String? layout;
  @override
  State<BusSeatLayOut> createState() => _BusSeatLayOutState();
}

class _BusSeatLayOutState extends State<BusSeatLayOut> {
  @override
  var _chairStatus = [
    [1, 1, 1, 1, 1, ],
    [1, 1, 1, 1, 1,],
    [1, 1, 1, 1, 1,],
    [1, 1, 1, 1, 1, ],
    [1, 1, 1, 1, 1,],
    [1, 1, 1, 1, 1, ],
    [1, 1, 1, 1, 1, ],
    [1, 1, 1, 1, 1,],
    [1, 1, 1, 1, 1, ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("KSRTC Swift Scania P-Series",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            margin: EdgeInsets.all(20),
            padding:EdgeInsets.all(10) ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12)
            ),
            child: Column(
              children: <Widget>[
                for (int i = 0; i < 9; i++)
                  Container(
                    margin: EdgeInsets.only(top: i == 0 ? 20 : 0),
                    child: Row(
                      children: <Widget>[
                        for (int x = 1; x < 6; x++)
                          Expanded(
                            child: (x == 3)
                                ? Container()
                                : Container(
                              margin: EdgeInsets.all(5),
                              child: _chairStatus[i][x - 1] == 1
                                  ? availableChair(i, x - 1)
                                  : _chairStatus[i][x - 1] == 2
                                  ? selectedChair(i, x - 1)
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
  }

  Widget selectedChair(int a, int b) {
    return InkWell(
      onTap: () {
        _chairStatus[a][b] = 1;
        setState(() {});
      },
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(3.0)),
      ),
    );
  }

  Widget availableChair(int a, int b) {
    return InkWell(
      onTap: () {
        _chairStatus[a][b] = 2;
        setState(() {});
      },
      child: Container(
        height: 40.0,
        width: 10.0,
        child: Image.asset("assets/images/busSeat.png"),
      ),
    );
  }

  Widget reservedChair() {
    return Container(
      height: 40.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: Color.fromRGBO(15, 15, 15, 0.24),
          borderRadius: BorderRadius.circular(3.0)),
    );
  }

}


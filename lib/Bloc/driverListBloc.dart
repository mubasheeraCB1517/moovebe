import 'dart:async';
import 'package:moovbe/Models/driverListModel.dart';
import 'package:moovbe/Network/response.dart';
import 'package:moovbe/repositories/driverListRepository.dart';

class DriverListBloc {
  DriverListRepository _driverListRepository = new DriverListRepository();
  final _driverListDataController = StreamController<Response<DriverList>>();

  StreamSink<Response<DriverList>> get driverListDataSink =>
      _driverListDataController.sink;

  Stream<Response<DriverList>>? get driverListDataStream =>
      _driverListDataController.stream;

  DriverListBloc() {
    _driverListRepository = DriverListRepository();
    getDriverList();
  }

  getDriverList() async {
    driverListDataSink.add(Response.loading('Fetching...'));
    try {
      DriverList _driverList = await _driverListRepository.driverList();
      if (_driverList != null) {
        driverListDataSink.add(Response.success(_driverList));
      } else {
        driverListDataSink.add(Response.error("Invalid Credentials"));
      }
    } catch (e) {
      driverListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _driverListDataController.close();
  }
}

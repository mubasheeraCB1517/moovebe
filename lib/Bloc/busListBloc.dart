import 'dart:async';
import 'package:moovbe/Models/busListModel.dart';
import 'package:moovbe/Network/response.dart';
import 'package:moovbe/repositories/busListRepository.dart';

class BusListBloc {
  BusListRepository _busListRepository = new BusListRepository();
  final _busListDataController = StreamController<Response<BusList>>();

  StreamSink<Response<BusList>> get busListDataSink =>
      _busListDataController.sink;

  Stream<Response<BusList>>? get busListDataStream =>
      _busListDataController.stream;

  BusListBloc() {
    _busListRepository = BusListRepository();
    getBusList();
  }

  getBusList() async {
    busListDataSink.add(Response.loading('Fetching...'));
    try {
      BusList _busList = await _busListRepository.busList();
      if (_busList != null) {
        busListDataSink.add(Response.success(_busList));
      } else {
        busListDataSink.add(Response.error("Invalid Credentials"));
      }
    } catch (e) {
      busListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _busListDataController.close();
  }
}

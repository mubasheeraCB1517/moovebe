import 'package:moovbe/Models/busListModel.dart';
import 'package:moovbe/Network/webApiProvider.dart';
import 'package:moovbe/constants.dart';

class BusListRepository {
  Future busList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "BusListApi/${apiKey}/",
        isPost: false,
        token: token,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return BusList.fromJson(response);
  }
}

import 'package:moovbe/Models/driverListModel.dart';
import 'package:moovbe/Network/webApiProvider.dart';
import 'package:moovbe/constants.dart';

class DriverListRepository {
  Future driverList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};

    final response = await WebApiProvider().getData(
        url: "DriverApi/${apiKey}/",
        isPost: false,
        token: token,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: false);
    return DriverList.fromJson(response);
  }
}

import 'package:flutter/material.dart';
import 'package:moovbe/Network/webApiProvider.dart';
import 'package:moovbe/constants.dart';

class DriverDeleteRepository {
  Future driverDelete(String? driverId, BuildContext context) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "driver_id": driverId,
    };

    final response = await WebApiProvider()
        .getData(
            url: "DriverApi/${apiKey}/",
            isPost: false,
            token: token,
            isPatch: false,
            isDelete: true,
            queryParameters: _queryParameters,
            isQueryParmeter: true)
        .then((value) {
      if (value["status"] == true) {
        Navigator.pop(context);
        Navigator.pushNamed(context, "/driverScreen");
      }
    });

    return response;
  }
}

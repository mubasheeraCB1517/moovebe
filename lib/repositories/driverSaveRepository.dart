import 'package:flutter/material.dart';
import 'package:moovbe/Network/webApiProvider.dart';
import 'package:moovbe/constants.dart';

class DriverSaveRepository {
  Future driverSave(
      String name, String mobile, String license, BuildContext context) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "name": name,
      "mobile": mobile,
      "license_no": license
    };

    final response = await WebApiProvider()
        .getData(
            url: "DriverApi/${apiKey}/",
            isPost: true,
            token: token,
            isPatch: false,
            isDelete: false,
            queryParameters: _queryParameters,
            isQueryParmeter: true)
        .then((value) {
      if (value["status"] == true) {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pushNamed(context, "/driverScreen");
      }
    });
    return response;
  }
}

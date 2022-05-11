



import 'package:moovbe/Network/webApiProvider.dart';

class LoginRepository {
  Future login() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "username":"admin_user",
      "password":"123admin789"
    };

    final response = await WebApiProvider().getData(
        url: "loginApi",
        isPost: true,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("data->>>>>>>>>${response}");
    return response;
  }
}

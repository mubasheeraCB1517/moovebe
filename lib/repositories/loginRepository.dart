
import 'package:moovbe/Network/webApiProvider.dart';

class LoginRepository {
  Future login( String username,String password) async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "username":username,
      "password":password
    };

    final response = await WebApiProvider().getData(
        url: "LoginApi",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("data->>>>>>>>>${response}");
    return response;
  }
}

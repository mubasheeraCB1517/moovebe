
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  var  _sharedPrefs  ;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  Future<void> clear() async {
    // var  showHideRegistration=SharedPrefs().showHideRegistrationButton;
    //print("showHideRegistration :"+showHideRegistration);
    await Future.delayed(const Duration(seconds: 2), () {});
    await _sharedPrefs.clear();
    // SharedPrefs().showHideRegistrationButton = showHideRegistration;
  }
//  String firstName = _sharedPrefs.getString("") ?? "";

}
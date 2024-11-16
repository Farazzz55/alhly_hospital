import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesUtils {
  static late SharedPreferences  sharedPreferences;
  static init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future<bool> ? saveData({required String key,  required dynamic value}){
    if(value is int){
      sharedPreferences.setInt(key, value);
    }else if (value is double){
      sharedPreferences.setDouble(key, value);
    }else if (value is String){
      sharedPreferences.setString(key, value);
    }else{
      sharedPreferences.setBool(key, value);

    }
  }
  static Object ? getData({required String key}){
    return sharedPreferences.get(key);
  }
  static Future<bool> removeData({required String key}) async {
    return sharedPreferences.remove(key);
  }

  static Future<bool> checkIfFirstTime() async {
    bool? isFirstTime = sharedPreferences.getBool('isFirstTime');
    if (isFirstTime == null || isFirstTime) {
      sharedPreferences.setBool('isFirstTime', false);
      return true;
    }
    return false;
  }

}
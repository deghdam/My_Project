import 'package:shared_preferences/shared_preferences.dart';

save({String key, String value}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
  //  print(value);
}
read(String key)async{
  final  prefs = await SharedPreferences.getInstance();
  String value = prefs.getString(key);
  return value;
}
// Gets User from shared preferences
import 'package:nuconta_marketplace/model/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map> requestUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return {
    "id": prefs.getString('id'),
    "name": prefs.getString('name'),
    "balance": prefs.getInt('balance'),
  };
}

Future<Null> saveUser(User user) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setString('id', user.id);
  prefs.setString('name', user.name);
  prefs.setInt('balance', user.balance);
}

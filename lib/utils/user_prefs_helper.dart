// Gets User from shared preferences
import 'package:shared_preferences/shared_preferences.dart';

Future<Map> requestUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return {
    "id": prefs.getString('id'),
    "name": prefs.getString('name'),
    "balance": prefs.getInt('balance'),
  };
}

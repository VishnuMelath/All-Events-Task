import 'package:shared_preferences/shared_preferences.dart';

class UserSources {
  String? name;
  bool isLoggedIn = false;

  getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    name = sharedPref.getString('name');
    isLoggedIn = sharedPref.getBool('isLoggedIn') ?? false;
  }

  saveDate() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool('isLoggedIn', isLoggedIn);
    if (name != null) await sharedPref.setString('name', name!);
  }
}

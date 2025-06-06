import 'package:shared_preferences/shared_preferences.dart';

class UserSources {
  static String? name;
  static bool isLoggedIn = false;
  static String? profileImage;

  static Future getData() async {
    final sharedPref = await SharedPreferences.getInstance();
    name = sharedPref.getString('name');
    profileImage = sharedPref.getString('profileImage');
    isLoggedIn = sharedPref.getBool('isLoggedIn') ?? false;
  }

  static Future saveDate() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool('isLoggedIn', isLoggedIn);
    if (name != null) await sharedPref.setString('name', name!);
    if (profileImage != null) {
      await sharedPref.setString('profileImage', profileImage!);
    }
  }
}

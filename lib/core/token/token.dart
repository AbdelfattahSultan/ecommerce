import 'package:shared_preferences/shared_preferences.dart';

class Token {
  static const _tokenKey = 'auth_token';

  static Future<void> saveToken(String token) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_tokenKey);
  }


}

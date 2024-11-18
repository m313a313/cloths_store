import 'package:shared_preferences/shared_preferences.dart';
import 'package:store2/core/constants/enums/auth_enum.dart';

class PreferencesService {
  final prefs = SharedPreferencesAsync();

  Future<void> saveString(String key, String value) async {
    await prefs.setString(key, value);
  }

  Future<AuthEnum> getToken(
    String key,
  ) async {
    final value = await prefs.getString(key);
    if (value == null) {
      return AuthEnum.unauthenticated;
    } else {
      return AuthEnum.authenticated;
    }
  }

  Future<void> remove(String key) async {
    await prefs.remove(key);
    
  }
}

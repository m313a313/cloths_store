import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store2/core/constants/enums/auth_enum.dart';
import 'package:store2/core/services/api_service.dart';
import 'package:store2/core/services/shared_preferences_service.dart';
part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<AuthEnum> build() async {
    var token = await PreferencesService().getToken('token');
    // throw 'here error';
    print('state: $state');
    return token;
  }

  void Login({required String email, required String password}) async {
    state = const AsyncLoading(); // AsyncValue.loading()

    state = await AsyncValue.guard(() async {
      // await login
      final data = await ApiService().postRequest(
          'https://fakestoreapi.com/auth/login',
          {"username": email, "password": password});
      // token to local storage
      PreferencesService().saveString('token', data?['token'] ?? '');
      return AuthEnum.authenticated;
    });
  }

  void logout() async {
    await PreferencesService().remove('token');
  }
}

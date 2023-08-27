import 'package:flutter_riverpod/flutter_riverpod.dart';


class User{
  User(this.username);
  

  String username;
}

class LoginNotifier extends StateNotifier<AsyncValue<User?>> {
  LoginNotifier() : super(AsyncValue.data(null));

  Future<void> login(String username, String password) async {
    try {
      state = AsyncValue.loading();

      // Simulate an asynchronous login process
      await Future.delayed(Duration(seconds: 2));

      // Replace this with actual authentication logic
      final authenticatedUser = User(username);

      state = AsyncValue.data(authenticatedUser);
    } catch (error) {
      state = AsyncValue.error(error,StackTrace.current);
    }
  }

  void logout() {
    state = AsyncValue.data(null);
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, AsyncValue<User?>>((ref) {
  return LoginNotifier();
});
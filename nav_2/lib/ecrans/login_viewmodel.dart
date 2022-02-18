import 'package:flutter/material.dart';
import 'package:nav_2/navigation/app_router.dart';

import '../data/user.dart';

abstract class LoginRouter {
  userDidLogin(User user);
}

class LoginViewModel extends ChangeNotifier {
  final LoginRouter _router;
  String? _username;
  String? _password;
  String? _userMessage;

  LoginViewModel(this._router);

  bool isLoading = false;
  String get userMessage => _userMessage ?? "";

  String? errorMessageForEmailInput(String? input) {
    return input != null && input.isNotEmpty ? null : "Enter a valid username";
  }

  String? errorMessageForPasswordInput(String? input) {
    return input != null && input.isNotEmpty ? null : "Enter a password";
  }

  userTypedUsername(String? username) {
    _username = username;
  }

  userTypedPassword(String? password) {
    _password = password;
  }

  submitLogin() async {
    final password = _password;
    final username = _username;
    if (username != null && password != null) {
      isLoading = true;
      _userMessage = null;
      notifyListeners();

      final loginSucceeded = await _checkCredentials(username, password);
      if (loginSucceeded) {
        _userMessage = "Bienvenue $username";

        _router.userDidLogin(User(id: 1, name: username, email: username));
      } else {
        _userMessage = "Veuillez vérifier vos identifiants";
      }
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> _checkCredentials(String username, String password) {
    return Future.delayed(
        const Duration(seconds: 1), () => password.contains(""));
  }
}

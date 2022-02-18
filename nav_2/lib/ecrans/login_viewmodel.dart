import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String? _username;
  String? _password;
  String? _userMessage;

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
      } else {
        _userMessage = "Veuillez vérifier vos identifiants";
      }
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> _checkCredentials(String username, String password) {
    return Future.delayed(
        const Duration(seconds: 3), () => password.contains("ok"));
  }
}

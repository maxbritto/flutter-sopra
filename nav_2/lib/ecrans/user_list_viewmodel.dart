import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../data/user.dart';

class UserListViewModel extends ChangeNotifier {
  List<User>? _userList;
  List<User> get userList => _userList ?? [];
  bool isLoading = false;
  final User user;

  UserListViewModel({required User this.user}) {
    _fetchData();
  }

  _fetchData() async {
    isLoading = true;
    notifyListeners();
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      final List userJsonList = jsonDecode(response.body);
      _userList = userJsonList
          .map((userJsonMap) => User.fromJSON(userJsonMap))
          .toList();
    }

    isLoading = false;
    notifyListeners();
  }
}

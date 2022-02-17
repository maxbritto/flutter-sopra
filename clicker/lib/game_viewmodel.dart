import 'dart:async';

import 'package:flutter/material.dart';

class GameViewModel extends ChangeNotifier {
  int _counter = 0;
  bool _isCounting = false;

  int get counter => _counter;
  bool get isCounting => _isCounting;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  _finTimer() {}

  startGame() {
    _isCounting = true;

    Timer(const Duration(seconds: 10), _finTimer);
    notifyListeners();
  }
}

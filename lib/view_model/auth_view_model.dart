import 'package:flutter/material.dart';
import 'dart:math' as math;

class AuthViewModel with ChangeNotifier {
  bool _loggedIn = math.Random().nextBool();
  bool get loggedIn => _loggedIn;

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  void logOut() {
    _loggedIn = false;
    notifyListeners();
  }
}

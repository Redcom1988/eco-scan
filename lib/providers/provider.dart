import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
  // Add your app state variables here

  // Example state
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

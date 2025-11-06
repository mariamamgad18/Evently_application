import 'package:flutter/material.dart';

class Appthemeprovider extends ChangeNotifier {
  bool _isLightTheme = true;

  bool get isLightTheme => _isLightTheme;

  void toggleTheme(bool isLight) {
    if (_isLightTheme == isLight) return;
    _isLightTheme = isLight;
    notifyListeners();
  }
}
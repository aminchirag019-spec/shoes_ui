import 'package:flutter/cupertino.dart';

class AppNetworkService extends ChangeNotifier {
  static final AppNetworkService instance = AppNetworkService._internal();
  AppNetworkService._internal();

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  void update(bool value) {
    if (_isOnline != value) {
      _isOnline = value;
      notifyListeners();
    }
  }
}

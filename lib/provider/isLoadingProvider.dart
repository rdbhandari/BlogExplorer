import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool isLoading = true;

  void setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }
}

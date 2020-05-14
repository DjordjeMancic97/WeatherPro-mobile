import 'package:flutter/foundation.dart';

class Switchers extends ChangeNotifier {
  bool isLoading = true;
  void loadingTimer() {
    Future.delayed(Duration(seconds: 3), () {
      isLoading = false;
      notifyListeners();
    });
  }

  bool isSearchVisible = false;
  void showSearch() {
    !isSearchVisible ? isSearchVisible = true : isSearchVisible = false;
    notifyListeners();
  }
}

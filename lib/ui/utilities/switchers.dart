import 'package:flutter/foundation.dart';


// This class containes all sorts of switches needed for visibility changes, timers etc...
// These values are passed between classes using Provider

class Switchers extends ChangeNotifier {

  // Loading screen duration time and switch
  bool isLoading = true;
  void loadingTimer() {
    Future.delayed(Duration(seconds: 3), () {
      isLoading = false;
      notifyListeners();
    });
  }

  // SearchField visibility switch
  bool isSearchVisible = false;
  void showSearch() {
    !isSearchVisible ? isSearchVisible = true : isSearchVisible = false;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class TimeReminder extends ChangeNotifier {
  var _pickedTime = 30;

  int get pickedTime => _pickedTime;

  getTime(int minutes) {
    _pickedTime = minutes;
    notifyListeners();
  }
}

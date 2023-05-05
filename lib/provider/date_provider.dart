import 'package:flutter/material.dart';

class DateProvider with ChangeNotifier {
  List<DateTime?> _selectedDate = [DateTime.now()];
  List<DateTime?> get date => _selectedDate;
  void setDate(List<DateTime?> newDates) {
    _selectedDate = newDates;
    notifyListeners();
  }
}

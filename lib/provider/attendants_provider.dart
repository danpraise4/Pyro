import 'package:flutter/material.dart';

import '../models/attendats/attendants_model.dart';

class AttendantsProvider extends ChangeNotifier {
  AttentantsModel? attendants;

  void updateAttendantsProvider(AttentantsModel account) {
    this.attendants = account;
    notifyListeners();
  }
}

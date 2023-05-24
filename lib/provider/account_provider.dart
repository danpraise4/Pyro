import 'package:flutter/material.dart';
import 'package:fuleap/models/account/account_model.dart';

class AccountProvider extends ChangeNotifier {
  AccountModel? account;

  void updateAccountProvider(AccountModel account) {
    this.account = account;
    notifyListeners();
  }
}

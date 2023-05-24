import 'package:flutter/material.dart';
import 'package:fuleap/models/wallet/wallet_model.dart';

class WalletProvider extends ChangeNotifier {
  walletModel? wallet;

  void updateWalletProvider(walletModel wallet) {
    this.wallet = wallet;
    notifyListeners();
  }
}

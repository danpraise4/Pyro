import 'package:flutter/material.dart';
import 'package:fuleap/models/wallet/transaction_model.dart';

class TransactionProvider extends ChangeNotifier {
  transactionModel? transactions;

  void updateTransactionProvider(transactionModel transaction) {
    this.transactions = transaction;
    notifyListeners();
  }
}

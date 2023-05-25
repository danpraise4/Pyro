import 'dart:convert';
import 'dart:developer';

import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/models/account/account_model.dart';
import 'package:fuleap/models/attendats/attendants_model.dart';
import 'package:fuleap/models/user/user_model.dart';
import 'package:fuleap/models/wallet/transaction_model.dart';
import 'package:fuleap/models/wallet/wallet_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'myemums.dart';

// ignore: prefer_typing_uninitialized_variables
var userStorage;

initStorage() async {
  await Hive.initFlutter();
  userStorage = await Hive.openBox(db_user);
}

getStorage({required String path}) {
  return userStorage.get(path);
}

setStorage({required String key, required value}) {
  return userStorage.put(key, value);
}

UserModel? getUser() {
  var value = userStorage.get(db_user);
  UserModel? model = UserModel.fromJson(value);
  return model;
}

AttentantsModel? getAttendants() {
  var value = userStorage.get(db_attandance);
  AttentantsModel? model = AttentantsModel.fromJson(value);
  return model;
}

AccountModel? getAccount() {
  var value = userStorage.get(db_account);

  AccountModel? model = AccountModel.fromJson(value);
  return model;
}

UserTtype getRole() {
  UserModel model = getUser()!;
  return model.user!.role! == 'station_manager'
      ? UserTtype.manager
      : UserTtype.attendant;
}

walletModel? getWallet() {
  var value = userStorage.get(db_wallet);
  walletModel? model = walletModel.fromJson(value);
  return model;
}

transactionModel? getTransactions({String? attendant_id}) {
  var value = userStorage.get(db_transaction(id: attendant_id));
  transactionModel? model = transactionModel.fromJson(value);
  return model;
}

getToken(Tokens token) {
  UserModel model = getUser()!;
  return token == Tokens.access
      ? model.token!.accessToken!
      : model.token!.refreshToken!;
}

upateToken(token) {
  UserModel model = getUser()!;
  model.token?.accessToken = token;
  setStorage(key: db_account, value: model.toJson());
}

logout() {
  userStorage.clear();
}

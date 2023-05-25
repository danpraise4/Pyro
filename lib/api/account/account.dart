// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/helpers/utils.dart';

class AccountApi extends Api {
  AccountApi(super.context);

  GetAccount(path, {body, required String storage}) async {
    Response? x = await ApiCall(path: path, type: RequestType.get, data: body);
    if (x != null) {
      setStorage(key: storage, value: x.data);
    }
  }

  PostAccount(path, {body, message, bool showToast = true}) async {
    Response? x = await ApiCall(path: path, type: RequestType.post, data: body);
    if (x != null) {
      print(x.data);
      if (showToast) {
        showMessage(context,
            title: "Success",
            message: message ?? "Data Pushed Ok",
            buttonText: "Close", onClick: () {
          Navigator.pop(context);
        });
      }

      return x.data;
    }
  }

  PatchAccount(path, {body, message}) async {
    Response? x =
        await ApiCall(path: path, type: RequestType.patch, data: body);
    if (x != null) {
      // ignore: use_build_context_synchronously
      showMessage(context,
          title: "Success",
          message: message ?? "Data Pushed Ok",
          buttonText: "Close", onClick: () {
        Navigator.pop(context);
      });
      return x;
    }
  }

  DeleteAccount(path, {body, message}) async {
    Response? x =
        await ApiCall(path: path, type: RequestType.delete, data: body);
    print(x);
    if (x != null) {
      // ignore: use_build_context_synchronously
      showMessage(context,
          title: "Success",
          message: message ?? "Data Pushed Ok",
          buttonText: "Close", onClick: () {
        Navigator.pop(context);
      });
      return x;
    }
  }
}

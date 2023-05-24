import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/screen/authentication/login.dart';

import '../helpers/utils.dart';

class Api {
  String baseUrl = 'https://test-pyro-api.herokuapp.com/api/v1/';
  BuildContext context;
  late Dio dio;

  Api(this.context) {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(seconds: 40),
        connectTimeout: const Duration(seconds: 40),
        sendTimeout: const Duration(seconds: 5));

    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        var hasToken = userStorage.get('token');
        print(options.uri);
        Map<String, String>? header;
        if (hasToken != null) {
          header = {'Authorization': 'Bearer ${getToken(Tokens.access)}'};
          options.headers.addAll(header);
        }

        return handler.next(options);
      },
      onError: (DioError e, ErrorInterceptorHandler handler) async {
        print(e.message);
        print(e.response!.statusCode);
        if (e.response?.statusCode! == 401) {
          await refreshToken();
          return handler.resolve(await _retry(e.requestOptions));
        }

        return handler.next(e);
      },
      onResponse: (Response e, ResponseInterceptorHandler handler) {
        return handler.next(e);
      },
    ));
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    print("retry was called");
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<Response?> ApiCall(
      {required path, data, required RequestType type}) async {
    try {
      Response? x;

      if (type == RequestType.post) {
        x = await dio.post(path, data: data);
      }

      if (type == RequestType.get) {
        x = await dio.get(path, data: data);
      }

      if (type == RequestType.patch) {
        x = await dio.patch(path, queryParameters: data);
      }

      if (type == RequestType.delete) {
        x = await dio.delete(path, data: data);
      }

      return x;
    } on DioError catch (e) {
      log(e.toString());
      if (context.mounted) {
        showMessage(context,
            title: "Error",
            message: e.response == null
                ? "Something bad happend"
                : (e.response?.data)["message"],
            buttonText: "Close");
      }

      return null;
    }
  }

  Future<void> refreshToken() async {
    ;
    final refreshToken = getToken(Tokens.refresh);

    try {
      final response = await dio
          .post(Endpoints.refreshToken, data: {'refreshToken': refreshToken});

      var accessToken = response.data["accessToken"];
      upateToken(accessToken);
    } on DioError catch (e) {
      logout();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => const Login()), (route) => false);
    }
  }
}

class Endpoints {
  static const String login = "/auth/station/login-email";
  static const String refreshToken = '/auth/station/regenerate-access-token';
  static const String getAccount = "/station/branch";
  static const String getAttendance = "/station/pump-attendant";
  static const String getTransactions = "/station/transactions";
  static const String getWallets = "/station/wallet";
  static const String getRemitMoney = "/station/remit-money";
  static const String getWithdraw = "/station/withdraw";
  static const String getBanks = "/payment/bank-list";
  static const String getUser = "/station/wallet";
}

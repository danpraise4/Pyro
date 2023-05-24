import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/provider/account_provider.dart';
import 'package:fuleap/provider/attendants_provider.dart';
import 'package:fuleap/provider/transaction_provider.dart';
import 'package:fuleap/provider/wallet_provider.dart';
import 'package:fuleap/screen/splash/splash.dart';
import 'package:provider/provider.dart';

import 'navigation/navigationService.dart';

void main() {
  initStorage();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AccountProvider()),
      ChangeNotifierProvider(create: (_) => AttendantsProvider()),
      ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ChangeNotifierProvider(create: (_) => WalletProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuleap',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: blue_),
          useMaterial3: true,
          fontFamily: 'Achi'),
      home: const Splash(),
    );
  }
}

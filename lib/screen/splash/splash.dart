import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/screen/wraper.dart';
import 'package:fuleap/widget/splash/splash_widget.dart';

import '../../navigation/navigationService.dart';
import '../authentication/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushReplacement(MaterialPageRoute(
                builder: (ctx) => getStorage(path: 'token') == null
                    ? const Login()
                    : const Wraper())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green_,
      body: Container(
        decoration: pathDecoration,
        alignment: Alignment.center,
        child: FuleapSplash().fuleapWelcome(),
      ),
    );
  }
}

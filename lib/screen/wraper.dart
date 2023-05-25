import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fuleap/api/account/account.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/navigation/routes.dart';
import 'package:fuleap/provider/account_provider.dart';
import 'package:fuleap/screen/chat/chat_home.dart';
import 'package:fuleap/screen/settings/settings_home.dart';
import 'package:fuleap/screen/wallet/all_transactions.dart';
import 'package:fuleap/screen/wallet/wallet_home.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:provider/provider.dart';

import 'attendance/attendant_home.dart';
import 'home/home.dart';

class Wraper extends StatefulWidget {
  const Wraper({super.key});

  @override
  State<Wraper> createState() => _WraperState();
}

class _WraperState extends State<Wraper> {
  int selected = 0;
  final _navigationKey = GlobalKey<NavigatorState>();

  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    log(getUser()!.toJson().toString());
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders_ = routeBuilders(context);

    return wrapPage(
        showBottom: true,
        selected: selected,
        appBar: const SizedBox(),
        inScroll: false,
        onChange: (x) {
          setState(() {
            selected = x;
            _pageController.animateToPage(x,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          });
        },
        children: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              selected = value;
            });
          },
          children: getRole() == UserTtype.manager
              ? [
                  const home(),
                  Navigator(
                    key: _navigationKey,
                    initialRoute: Routes.root,
                    onGenerateRoute: (routeSettings) {
                      print(routeSettings.name);
                      return MaterialPageRoute(
                        settings: routeSettings,
                        builder: (context) =>
                            routeBuilders_![routeSettings.name]!(context),
                      );
                    },
                  ),
                  const walletHome(),
                  const chatHome(),
                  const settingsHome()
                ]
              : [
                  const attendantHome(),
                  const allTranactions(),
                  const settingsHome()
                ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:fuleap/screen/attendance/all_attendance.dart';
import 'package:fuleap/screen/wallet/wallet_home.dart';

import '../screen/attendance/open_attendant.dart';
import '../screen/wallet/all_transactions.dart';

class Routes {
  static const String root = '/';
  static const String view = '/view';
  static const String wallet = '/wallet';
  static const String history = '/wallet/transactions';
}

Map<String, WidgetBuilder>? routeBuilders(
  BuildContext context,
) {
  return {
    Routes.wallet: (context) => const walletHome(),
    Routes.root: (context) => const allAttendance(),
    Routes.view: (context) => const openAttendant(),
    Routes.history: (context) => const allTranactions(),
  };
}

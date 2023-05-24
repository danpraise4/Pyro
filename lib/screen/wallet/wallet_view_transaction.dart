import 'package:flutter/material.dart';
import 'package:fuleap/models/wallet/parse_transaction_model.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

import '../../widget/general/transaction_card.dart';

// ignore: camel_case_types
class walletViewTransactionHistory extends StatefulWidget {
  const walletViewTransactionHistory({super.key});

  @override
  State<walletViewTransactionHistory> createState() =>
      _walletViewTransactionHistoryState();
}

class _walletViewTransactionHistoryState
    extends State<walletViewTransactionHistory> {
  @override
  Widget build(BuildContext context) {
    parseTransactionModel model = parseTransactionModel(
        total: 2345,
        title: "TRANSACTION RECIPET",
        status: "GOOD",
        data: [
          Data(mKey: "Ref", mValue: "FL-REF-34567845", isAmount: false),
          Data(mKey: "Fuel Station", mValue: "NNPusy", isAmount: false),
          Data(mKey: "Fuel Attendant", mValue: "Praise", isAmount: false),
          Data(mKey: "Branch", mValue: "Asokoro", isAmount: false),
          Data(mKey: "Amount", mValue: 2453, isAmount: true),
          Data(mKey: "VAT", mValue: 23, isAmount: true),
          Data(
              mKey: "Transaction Time",
              mValue: "23/10 10:00 am",
              isAmount: false),
        ]);
    return wrapPage(
        appBar: customAppBar(context).titleAppBar(title: "Transaction details"),
        children: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            transactionCard(
              hasShadow: true,
              canDownloadInvoice: true,
              model: model,
            )
          ],
        ));
  }
}

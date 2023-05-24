import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/models/wallet/parse_transaction_model.dart';
import 'package:fuleap/screen/wallet/wallet_transaction_status.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

import '../../helpers/myemums.dart';
import '../../widget/general/button.dart';
import '../../widget/general/inpute.dart';
import '../../widget/general/transaction_card.dart';

// ignore: camel_case_types
class walletConfirmTransaction extends StatefulWidget {
  const walletConfirmTransaction({super.key});

  @override
  State<walletConfirmTransaction> createState() =>
      _walletConfirmTransactionState();
}

class _walletConfirmTransactionState extends State<walletConfirmTransaction> {
  var pinController = TextEditingController();
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
              hasShadow: false,
              canDownloadInvoice: false,
              model: model,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 30),
                  child: const Text(
                    "Enter Pin to confirm transaction",
                    style: TextStyle(color: green_),
                  ),
                ),
                pinPut(
                  controller: pinController,
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
            customButton(
              onClick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const walletTransactionStatus()));
              },
              isActive: true,
              isLoading: false,
              text: "Confirm Transaction",
              type: BottonType.small,
            )
          ],
        ));
  }
}

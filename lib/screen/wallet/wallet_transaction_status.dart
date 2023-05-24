import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/models/wallet/parse_transaction_model.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

import '../../helpers/myemums.dart';
import '../../widget/general/button.dart';
import '../../widget/general/transaction_card.dart';

// ignore: camel_case_types
class walletTransactionStatus extends StatefulWidget {
  const walletTransactionStatus({super.key});

  @override
  State<walletTransactionStatus> createState() =>
      _walletTransactionStatusState();
}

class _walletTransactionStatusState extends State<walletTransactionStatus> {
  var pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    parseTransactionModel model = parseTransactionModel(
        total: 2345,
        title: "TRANSACTION RECIPET",
        status: "GOOD",
        message: "Successful",
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
        appBar: customAppBar(context).titleAppBar(title: ""),
        children: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      '${imagesPath}success.png',
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 190,
                    ),
                    transactionCard(
                      hasShadow: true,
                      canDownloadInvoice: true,
                      model: model,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            customButton(
              onClick: () {},
              isActive: true,
              isLoading: false,
              text: "Rate Station",
              type: BottonType.small,
            )
          ],
        ));
  }
}

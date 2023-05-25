import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:fuleap/models/wallet/parse_transaction_model.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

import '../../widget/general/transaction_card.dart';
import '../../models/wallet/transaction_model.dart' as Tran;

// ignore: camel_case_types
class walletViewTransactionHistory extends StatefulWidget {
  walletViewTransactionHistory({super.key, required this.data});

  Tran.Data data;
  @override
  State<walletViewTransactionHistory> createState() =>
      _walletViewTransactionHistoryState();
}

class _walletViewTransactionHistoryState
    extends State<walletViewTransactionHistory> {
  @override
  //0015362209
  Widget build(BuildContext context) {
    parseTransactionModel model = parseTransactionModel(
        total: (widget.data.meta!.fee! + widget.data.amount!),
        title: "TRANSACTION RECIPET",
        status: "GOOD",
        data: [
          Data(mKey: "Ref", mValue: widget.data.reference, isAmount: false),
          Data(
              mKey: "Type",
              mValue: widget.data.type!.toUpperCase(),
              isAmount: false),
          Data(
              mKey: "Category",
              mValue: widget.data.category!.replaceAll("_", " "),
              isAmount: false),
          Data(
              mKey: "From",
              mValue: widget.data.meta!.payerName,
              isAmount: false),
          Data(mKey: "Status", mValue: widget.data.status, isAmount: false),
          Data(
              mKey: "Source",
              mValue: widget.data.source!.replaceAll("_", " "),
              isAmount: false),
          Data(mKey: "Amount", mValue: widget.data.amount, isAmount: true),
          Data(mKey: "Charge", mValue: widget.data.meta!.fee, isAmount: true),
          Data(
              mKey: "Transaction Time",
              mValue: DateTime.parse(widget.data.createdAt!)
                  .format('MMMM dd y, h:mm a'),
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

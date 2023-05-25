import 'package:flutter/material.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/shadow_box.dart';
import 'package:fuleap/widget/general/transaction_template.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

class allTranactions extends StatefulWidget {
  const allTranactions({super.key});

  @override
  State<allTranactions> createState() => _allTranactionsState();
}

class _allTranactionsState extends State<allTranactions> {
  @override
  Widget build(BuildContext context) {
    return wrapPage(
        inScroll: false,
        appBar: customAppBar(context).titleAppBar(title: "Transaction"),
        children: Container(
          margin: const EdgeInsets.only(bottom: 120),
          child: shadowBox(context,
              child: TransactionsHolder(
                id: getUser()!.user!.id,
                physics: const AlwaysScrollableScrollPhysics(),
              )),
        ));
  }
}

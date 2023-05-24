import 'package:flutter/material.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/api/wallet/wallet.dart';
import 'package:fuleap/models/wallet/bank_model.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/extras.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

import '../../helpers/constants.dart';

class walletSelectBank extends StatefulWidget {
  const walletSelectBank({super.key});

  @override
  State<walletSelectBank> createState() => _walletSelectBankState();
}

class _walletSelectBankState extends State<walletSelectBank> {
  var textController = TextEditingController();

  List<bankModel>? models;

  GetBanks() async {
    var x = await WalletApi(context)
        .GetWallet(Endpoints.getBanks, storage: db_banks);
    setState(() {
      if (x == null) {
        models = [];
      } else {}
    });
  }

  @override
  void initState() {
    super.initState();
    GetBanks();
  }

  @override
  Widget build(BuildContext context) {
    return wrapPage(
        inScroll: false,
        appBar: customAppBar(context).titleAppBar(title: "Select Bank"),
        children: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: white_,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(-1, 0),
                      spreadRadius: 12,
                      blurRadius: 9,
                      color: Color.fromRGBO(244, 244, 244, 1),
                    )
                  ]),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                          hintText: "Search Bank", border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: models == null
                    ? Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : models!.isEmpty
                        ? Empty()
                        : Container())
          ],
        ));
  }
}

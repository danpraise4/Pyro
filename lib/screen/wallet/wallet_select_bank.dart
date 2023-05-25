import 'dart:math';

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
  String query = '';

  List<bankModel>? models;
  List<bankModel>? searh;

  GetBanks() async {
    var x = await WalletApi(context)
        .GetWallet(Endpoints.getBanks, storage: db_banks);
    if (x == null) {
      models = [];
    } else {
      models = [];
      (x as List<dynamic>).forEach((element) {
        models!.add(bankModel.fromJson(element));
      });
    }
    setState(() {
      searh = models;
    });
  }

  SingleBank({required bankModel bank}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, bank);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: gray_, borderRadius: BorderRadius.circular(10)),
                  ),
                  Text(bank.name!)
                ])),
            Divider()
          ],
        ),
      ),
    );
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
                      onChanged: (x) {
                        if (models == null) {
                          return;
                        }
                        searh = [];
                        models!.forEach((element) {
                          if (element.name!
                              .toLowerCase()
                              .contains(x.toLowerCase())) {
                            searh!.add(element);
                          }
                        });

                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          hintText: "Search Bank", border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: models == null
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : models!.isEmpty
                        ? Empty()
                        : ListView.builder(
                            itemCount: searh!.length,
                            itemBuilder: (_, x) {
                              return SingleBank(bank: searh![x]);
                            }))
          ],
        ));
  }
}

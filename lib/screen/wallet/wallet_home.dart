import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/api/wallet/wallet.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/models/wallet/transaction_model.dart';
import 'package:fuleap/models/wallet/wallet_model.dart';
import 'package:fuleap/provider/wallet_provider.dart';
import 'package:fuleap/screen/wallet/wallet_fund.dart';
import 'package:fuleap/screen/wallet/wallet_remit.dart';
import 'package:fuleap/screen/wallet/wallet_withdrawal.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/shadow_box.dart';
import 'package:fuleap/widget/general/transaction_template.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:provider/provider.dart';

import '../../helpers/storage.dart';
import '../../helpers/utils.dart';
import '../../widget/general/text_wrap.dart';
import '../../widget/general/transaction.dart';

class walletHome extends StatefulWidget {
  const walletHome({super.key});

  @override
  State<walletHome> createState() => _walletHomeState();
}

class _walletHomeState extends State<walletHome> {
  updateWallet() async {
    if (getStorage(path: db_wallet) != null) {
      Provider.of<WalletProvider>(context, listen: false)
          .updateWalletProvider(getWallet()!);
    }
    await WalletApi(context).GetWallet(
      '${Endpoints.getWallets}/${getUser()?.user?.meta?.stationBranch}',
      storage: db_wallet,
    );

    Provider.of<WalletProvider>(context, listen: false)
        .updateWalletProvider(getWallet()!);
  }

  List<Map<String, dynamic>> options = [
    {
      "title": 'Remit',
      'icon': 'send',
      'action': (context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const walletRemit()));
      },
    },
    {
      "title": 'Fund',
      'icon': 'get',
      'action': (context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const walletFund()));
      },
    },
    {
      "title": 'Withdraw',
      'icon': 'transfer',
      'action': (context) {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => const walletWithdrawal()));
      },
    },
    {
      "title": 'Scan',
      'icon': 'scan_code_small',
      'action': (context) {},
    }
  ];

  @override
  void initState() {
    super.initState();
    Timer(Duration.zero, () {
      updateWallet();
    });
  }

  @override
  Widget build(BuildContext context) {
    walletModel? walletModels = context.watch<WalletProvider>().wallet;
    return wrapPage(
        isLoading: walletModels == null,
        appBar: customAppBar(context).profileAppBar(showScan: false),
        children: Column(
          children: [
            Container(
              height: 215,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(children: [
                SvgPicture.asset(
                  "${svgPath}background.svg",
                  fit: BoxFit.contain,
                  height: 300,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Balance",
                          style: TextStyle(
                              color: white_, fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {
                            showQRCode(context, uid: "3456783456");
                          },
                          child: SvgPicture.asset(
                            '${svgPath}scan_code.svg',
                            color: white_,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: amountText(walletModels!.availableBalance,
                          form: AmountForm.form1, color: white_, fontSize: 23),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List<Widget>.generate(
                            options.length,
                            (index) => commonButtons(context).actionButton(
                                title: options[index]["title"],
                                icon: options[index]["icon"],
                                onClick: options[index]["action"])),
                      ),
                    ),
                  ]),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Transaction History"), Text("See All")]),
            ),
            Container(
              child: shadowBox(context,
                  margin: const EdgeInsets.only(
                      bottom: 130, left: 15, right: 15, top: 15),
                  child: TransactionsHolder()),
            ),
          ],
        ));
  }
}

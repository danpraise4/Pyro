import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/api/wallet/wallet.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/models/wallet/payment_options_model.dart';
import 'package:fuleap/models/wallet/wallet_model.dart';
import 'package:fuleap/provider/wallet_provider.dart';
import 'package:fuleap/screen/wallet/wallet_confirm_transaction.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/payment_options.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:provider/provider.dart';

class walletFundProcess extends StatefulWidget {
  walletFundProcess({super.key, required this.amount});

  String amount;

  @override
  State<walletFundProcess> createState() => _walletFundProcessState();
}

class _walletFundProcessState extends State<walletFundProcess> {
  final formKey = GlobalKey<FormState>();

  List<paymentOptionsModel> options = [];

  int? selected;

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    walletModel? walletModels = context.watch<WalletProvider>().wallet;
    paymentOptionsModel dedicatedAccount = paymentOptionsModel(
        token: "",
        user: walletModels!.walletName,
        type: "account",
        number: walletModels.walletNumber,
        bank: walletModels.bankName,
        icon: "");

    List<String> actions = [
      "Login to your desired bank app",
      "Select <strong>Transfer Money</strong>",
      "Select <strong>${walletModels.bankName}</strong> as the bank",
      "Enter your <strong>${walletModels.bankName}</strong> account number <strong>${walletModels.walletNumber}</strong>",
      "Confirm transaction details and enter you <stron>bank app pin</strong>"
    ];

    return wrapPage(
        inScroll: true,
        appBar: customAppBar(context).titleAppBar(title: "Fund Wallet"),
        children: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              paymentOption(
                dedicatedAccount,
                index: -1,
                selected: selected,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  children: [
                    Text(
                      "How to transfer to Fuleap account from any bank",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: lightBlue_.withOpacity(.5),
                    borderRadius: inputeRadius),
                child: Column(
                  children: List<Widget>.generate(
                      actions.length,
                      (index) => Html(
                            data: actions[index],
                          )),
                ),
              )
            ],
          ),
        ));
  }
}

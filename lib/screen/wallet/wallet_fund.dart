import 'package:flutter/material.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/api/wallet/wallet.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/models/wallet/payment_options_model.dart';
import 'package:fuleap/models/wallet/wallet_model.dart';
import 'package:fuleap/provider/wallet_provider.dart';
import 'package:fuleap/screen/wallet/wallet_confirm_transaction.dart';
import 'package:fuleap/widget/general/amount_picker.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/inpute.dart';
import 'package:fuleap/widget/general/payment_options.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class walletFund extends StatefulWidget {
  const walletFund({super.key});

  @override
  State<walletFund> createState() => _walletFundState();
}

class _walletFundState extends State<walletFund> {
  final _amountController = TextEditingController();
  final _walletIdController = TextEditingController();
  final _narationController = TextEditingController();
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

    options = [
      paymentOptionsModel(
          token: "",
          user: "Daniel Possible",
          type: "card",
          number: "1234567890",
          bank: "Zenith Bank",
          icon: ""),
      paymentOptionsModel(
          token: "",
          user: "Daniel Possible",
          type: "card",
          bank: "Wema Bank",
          number: "1234567890",
          icon: "")
    ];
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

    return wrapPage(
        inScroll: true,
        appBar: customAppBar(context).titleAppBar(title: "Fund Wallet"),
        children: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              inputeField(
                _amountController,
                label: "Amount",
                hint: "Enter amount",
                required: true,
                inputeType: TextInputType.number,
                validator: Validatorless.multiple([
                  Validatorless.required("Amount is required"),
                  Validatorless.number("Invalid digit")
                ]),
              ),
              amountPicker(context,
                  amounts: [5000, 10000, 50000, 100000],
                  hasMax: true, onMax: () {
                _amountController.text =
                    walletModels.availableBalance!.toString();
              }, onChange: (val) {
                setState(() {
                  _amountController.text = '$val';
                });
              }),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //   child: const Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [Text("Fund from a card"), Text("Add new card +")],
              //   ),
              // ),
              // Column(
              //   children: List<Widget>.generate(options.length, (index) {
              //     return paymentOption(
              //       options[index],
              //       index: index,
              //       selected: selected,
              //       onClick: (idx) {
              //         setState(() {
              //           selected = idx;
              //         });
              //       },
              //     );
              //   }),
              // ),
              paymentOption(
                dedicatedAccount,
                index: options.length,
                selected: selected,
                onClick: (idx) {
                  setState(() {
                    selected = idx;
                  });
                },
              ),
              customButton(
                onClick: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const walletConfirmTransaction()));
                },
                isActive: true,
                isLoading: false,
                text: "FUND",
                type: BottonType.small,
              )
            ],
          ),
        ));
  }
}

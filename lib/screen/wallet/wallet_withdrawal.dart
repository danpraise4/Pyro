// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/api/wallet/wallet.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/helpers/utils.dart';
import 'package:fuleap/models/wallet/bank_model.dart';
import 'package:fuleap/screen/wallet/wallet_beneficiaries.dart';
import 'package:fuleap/screen/wallet/wallet_select_bank.dart';
import 'package:fuleap/widget/general/amount_picker.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/inpute.dart';
import 'package:fuleap/widget/general/save_beneficiary.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:validatorless/validatorless.dart';

import '../../widget/general/text_wrap.dart';

class walletWithdrawal extends StatefulWidget {
  const walletWithdrawal({super.key});

  @override
  State<walletWithdrawal> createState() => _walletWithdrawalState();
}

class _walletWithdrawalState extends State<walletWithdrawal> {
  final _amountController = TextEditingController();
  final _walletIdController = TextEditingController();
  final _narationController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bankModel? selectedBank;

  validate() {}

  @override
  Widget build(BuildContext context) {
    return wrapPage(
        inScroll: true,
        context: context,
        appBar: customAppBar(context).titleAppBar(title: "Withdrawal"),
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
                  Validatorless.number("Invalid digit"),
                ]),
              ),
              amountPicker(context,
                  amounts: [5000, 10000, 50000, 100000],
                  hasMax: true, onMax: () {
                _amountController.text =
                    getWallet()!.availableBalance!.toString();
              }, onChange: (val) {
                setState(() {
                  _amountController.text = '$val';
                });
              }),
              GestureDetector(
                onTap: () async {
                  selectedBank = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const walletSelectBank()));
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: inputeText(null,
                          label: "Bank",
                          required: true,
                          hint: selectedBank?.name ?? "Select Bank",
                          more: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          icon: Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                                color: gray_, borderRadius: inputeRadius),
                          ),
                          inputeType: TextInputType.text),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const walletBeneficiary()));
                      },
                      child: Container(
                        width: 52,
                        height: 52,
                        margin: const EdgeInsets.only(top: 30, right: 20),
                        decoration: BoxDecoration(
                            color: green_, borderRadius: inputeRadius),
                        child: const Icon(
                          Icons.person,
                          color: white_,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              inputeField(_walletIdController,
                  label: "Account Number",
                  required: true,
                  hint: "Enter Account Number",
                  validator: Validatorless.multiple([
                    Validatorless.required("Account number is required"),
                    Validatorless.number("Invalid digit"),
                    Validatorless.max(10, "Must be 10 digits"),
                    Validatorless.min(10, "Must be 10 digits")
                  ]),
                  inputeType: TextInputType.number),
              saveBeneficary(),
              inputeField(
                _narationController,
                label: "Narration",
                hint: "Narration",
                validator: Validatorless.multiple([
                  Validatorless.required("Narration is required"),
                ]),
                inputeType: TextInputType.text,
              ),
              customButton(
                onClick: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  if (selectedBank == null) {
                    showMessage(context,
                        title: "Select Bank",
                        message:
                            "You not selected a bank yet. Kindly select a bank",
                        buttonText: "Close");
                    return;
                  }

                  context.loaderOverlay.show();

                  String accountNumber = _walletIdController.text;
                  var x = await WalletApi(context)
                      .PostWallet(Endpoints.getBankUser, body: {
                    "bankId": selectedBank!.id,
                    "accountNumber": accountNumber
                  });

                  print(x);

                  context.loaderOverlay.hide();
                },
                isActive: true,
                isLoading: false,
                text: "SEND",
                type: BottonType.small,
              )
            ],
          ),
        ));
  }
}

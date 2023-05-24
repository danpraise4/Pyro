import 'package:flutter/material.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/api/wallet/wallet.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/widget/general/amount_picker.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/inpute.dart';
import 'package:fuleap/widget/general/save_beneficiary.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:uuid/uuid.dart';
import 'package:validatorless/validatorless.dart';

class walletRemit extends StatefulWidget {
  const walletRemit({super.key});

  @override
  State<walletRemit> createState() => _walletRemitState();
}

class _walletRemitState extends State<walletRemit> {
  final _amountController = TextEditingController();
  final _walletIdController = TextEditingController();
  final _narationController = TextEditingController();

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return wrapPage(
        inScroll: true,
        appBar: customAppBar(context).titleAppBar(title: "Remit"),
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
                  hasMax: true,
                  onMax: () {}, onChange: (val) {
                setState(() {
                  _amountController.text = '$val';
                });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: inputeField(_walletIdController,
                        label: "Wallet ID",
                        required: true,
                        hint: "Enter wallet ID",
                        validator: Validatorless.multiple([
                          Validatorless.required("Wallet ID is required"),
                          Validatorless.number("Invalid digit"),
                          Validatorless.max(10, "Must be 10 digits"),
                          Validatorless.min(10, "Must be 10 digits")
                        ]),
                        inputeType: TextInputType.number),
                  ),
                  Container(
                    width: 52,
                    height: 52,
                    margin: const EdgeInsets.only(top: 30, right: 20),
                    decoration: BoxDecoration(
                        color: green_, borderRadius: inputeRadius),
                    child: const Icon(
                      Icons.person,
                      color: white_,
                    ),
                  )
                ],
              ),
              saveBeneficary(),
              inputeField(_narationController,
                  label: "Narration",
                  hint: "Narration",
                  inputeType: TextInputType.text,
                  validator: Validatorless.multiple([
                    Validatorless.required("Narration is required"),
                  ])),
              customButton(
                onClick: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  context.loaderOverlay.show();
                  setState(() {
                    isLoading = true;
                  });
                  String idenpotent = Uuid().v4();
                  String walletNumber = _walletIdController.text;
                  String description = _narationController.text;
                  var amount = double.parse(_amountController.text);

                  var x = await WalletApi(context)
                      .PostWallet(Endpoints.getRemitMoney, body: {
                    "amount": amount,
                    "idempotentKey": idenpotent,
                    "walletNumber": walletNumber,
                    "purpose": description
                  });

                  context.loaderOverlay.hide();
                  setState(() {
                    isLoading = false;
                  });
                },
                isActive: true,
                isLoading: isLoading,
                text: "SEND",
                type: BottonType.small,
              )
            ],
          ),
        ));
  }
}

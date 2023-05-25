import 'package:flutter/material.dart';
import 'package:fuleap/api/account/account.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/api/wallet/wallet.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/helpers/utils.dart';
import 'package:fuleap/widget/general/amount_picker.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/image.dart';
import 'package:fuleap/widget/general/inpute.dart';
import 'package:fuleap/widget/general/save_beneficiary.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:uuid/uuid.dart';
import 'package:validatorless/validatorless.dart';

class attendantHome extends StatefulWidget {
  const attendantHome({super.key});

  @override
  State<attendantHome> createState() => _attendantHomeState();
}

class _attendantHomeState extends State<attendantHome> {
  final _amountController = TextEditingController();

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  String? fuel;

  Map? transaction;

  Callme() {}

  @override
  void initState() {
    super.initState();

    Callme();
  }

  @override
  Widget build(BuildContext context) {
    return wrapPage(
        inScroll: true,
        appBar: customAppBar(context).profileAppBar(showScan: false),
        children: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: transaction == null
              ? Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: const Row(
                        children: [
                          Text("Station Name"),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: inputeBorder,
                          color: lightBlue_,
                          borderRadius: inputeRadius),
                      child: const Row(
                        children: [
                          Text("AA Rano"),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: const Row(
                        children: [
                          Text("Fuel Type"),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          border: inputeBorder,
                          color: lightBlue_,
                          borderRadius: inputeRadius),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text(
                          fuel ?? "Click to select",
                          style: const TextStyle(color: gray_),
                        ),
                        items: <String>[
                          'PMS',
                          'gas',
                          'kerosine',
                          'disel',
                          'lubricant'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (x) {
                          setState(() {
                            fuel = x;
                          });
                        },
                      ),
                    ),
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
                        amounts: [1000, 5000, 10000, 50000, 100000],
                        hasMax: false,
                        onMax: () {}, onChange: (val) {
                      setState(() {
                        _amountController.text = '$val';
                      });
                    }),
                    customButton(
                      onClick: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }

                        if (fuel == null) {
                          showMessage(context,
                              title: "Missing fuel type",
                              message: "Please select fuel Type",
                              buttonText: "Close");
                          return;
                        }
                        context.loaderOverlay.show();
                        setState(() {
                          isLoading = true;
                        });

                        var amount = double.parse(_amountController.text);

                        var x = await AccountApi(context)
                            .PostAccount(Endpoints.getQrCode,
                                body: {
                                  "amount": amount,
                                  "fuelType": fuel,
                                },
                                showToast: false);

                        context.loaderOverlay.hide();
                        setState(() {
                          isLoading = false;
                          transaction = x;
                        });
                      },
                      isActive: true,
                      isLoading: isLoading,
                      text: "Generate",
                      type: BottonType.large,
                    )
                  ],
                )
              : Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 50),
                        child: Base64Image(
                            data: transaction!["qrCode"], h: 300, w: 300)),
                    customButton(
                      onClick: () async {
                        setState(() {
                          transaction = null;
                        });
                      },
                      isActive: true,
                      isLoading: isLoading,
                      text: "Done",
                      type: BottonType.large,
                    )
                  ],
                ),
        ));
  }
}

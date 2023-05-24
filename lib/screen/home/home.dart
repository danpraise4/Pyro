// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fuleap/api/account/account.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/models/account/account_model.dart';
import 'package:fuleap/provider/account_provider.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/shadow_box.dart';
import 'package:fuleap/widget/general/single_products.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../../helpers/storage.dart';
import '../../widget/general/app_bar.dart';
import '../../widget/general/text_wrap.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  bool isActive = true;
  List<Map<String, dynamic>> products_ = [];

  updateAccount() async {
    if (getStorage(path: db_account) != null) {
      print(getAccount()!.toJson());
      Provider.of<AccountProvider>(context, listen: false)
          .updateAccountProvider(getAccount()!);
    }
    await AccountApi(context).GetAccount(Endpoints.getAccount,
        storage: db_account,
        body: {'branchId': getUser()?.user?.meta?.stationBranch ?? ''});

    Provider.of<AccountProvider>(context, listen: false)
        .updateAccountProvider(getAccount()!);
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration.zero, () => updateAccount());
  }

  @override
  Widget build(BuildContext context) {
    AccountModel? accountModel = context.watch<AccountProvider>().account;

    if (accountModel != null) {
      products_ = [];

      accountModel.station?.config?.toJson().forEach((key, value) {
        if (key != 'pumpCount' && key != 'openTime') {
          products_.add({
            'title': key,
            'status': value?['isAvailable'] ?? false,
            'price': value?['price'] ?? 0,
          });
        }
      });
    }

    return wrapPage(
      inScroll: true,
      isLoading: accountModel == null,
      appBar: customAppBar(context).profileAppBar(),
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shadowBox(context,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      h1Text(stationStatus),
                      FlutterSwitch(
                        width: 60.0,
                        height: 30.0,
                        valueFontSize: 25.0,
                        toggleSize: 20.0,
                        value: isActive,
                        borderRadius: 30.0,
                        padding: 8.0,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            isActive = val;
                          });
                        },
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text(
                      open,
                      style: TextStyle(color: darkBlue_, fontSize: 14),
                    ),
                  ),
                  Row(
                    children: [
                      boxText(accountModel?.station?.config?.openTime?.from,
                          hint: timeHint, label: from),
                      const SizedBox(
                        width: 20,
                      ),
                      boxText(accountModel?.station?.config?.openTime?.to,
                          hint: timeHint, label: to),
                    ],
                  )
                ],
              )),
          !isActive
              ? shadowBox(context,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          h1Text(stationStatus),
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_back_ios_outlined,
                                size: 20,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: boxText(
                                  null,
                                  hint: "",
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ))
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: h1Text(products),
          ),
          shadowBox(context,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: products_.isEmpty
                        ? Container(
                            margin: const EdgeInsets.all(20),
                            child: const Text(
                              "Nothing here to display",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13),
                            ),
                          )
                        : Column(
                            children: List<Widget>.generate(
                                products_.length,
                                (index) =>
                                    singleProducts(data: products_[index])),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //
                        },
                        child: const Text(
                          addProducts,
                          style: TextStyle(
                              color: green_, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                ],
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 150),
            alignment: Alignment.topCenter,
            child: customButton(
                type: BottonType.small,
                isActive: true,
                isLoading: false,
                text: "  ${update.toUpperCase()}         "),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fuleap/api/account/account.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/models/attendats/attendants_model.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/profile_image.dart';
import 'package:fuleap/widget/general/transaction_template.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../widget/general/app_bar.dart';
import '../../widget/general/shadow_box.dart';
import '../../widget/general/text_wrap.dart';
import '../../widget/general/transaction.dart';

// ignore: camel_case_types
class openAttendant extends StatefulWidget {
  const openAttendant({super.key});

  @override
  State<openAttendant> createState() => _openAttendantState();
}

class _openAttendantState extends State<openAttendant> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    Data attendant = (args as Data);

    return wrapPage(
      appBar: customAppBar(context).titleAppBar(title: ''),
      children: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: profileImage(
              w: 100,
              h: 100,
            ),
          ),
          Text("${attendant.firstName} ${attendant.lastName}",
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: black_, fontSize: 15)),
          Text(
            attendant.systemCode!,
            style: const TextStyle(fontWeight: FontWeight.w600, color: green_),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                analysisText(
                    value: "42 sales",
                    title: "Today",
                    crossAxisAlignment: CrossAxisAlignment.end),
                Container(
                  height: 60,
                  width: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  color: lightGray_,
                ),
                analysisText(
                  value: "NGN45,567",
                  title: "This year",
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                borderButton(
                  isActive: true,
                  isLoading: false,
                  text: "Suspend",
                  type: BottonType.small,
                  onClick: () async {
                    log(attendant.toJson().toString());
                    context.loaderOverlay.show();
                    await AccountApi(context).PatchAccount(
                        Endpoints.getAttendance,
                        body: {
                          "pumpAttendantId": attendant.id,
                          "reason": "No reason",
                          "status": "deactivated"
                        },
                        message: "Attendant delete!!");
                    context.loaderOverlay.hide();
                  },
                ),
                customButton(
                  isActive: true,
                  isLoading: false,
                  color: blueGray_,
                  text: " Delete      ",
                  type: BottonType.small,
                  onClick: () async {
                    context.loaderOverlay.show();
                    await AccountApi(context).DeleteAccount(
                        Endpoints.getAttendance,
                        message: "Attendant delete!!");
                    context.loaderOverlay.hide();
                  },
                ),
              ],
            ),
          ),
          Container(
            child: shadowBox(context,
                margin: const EdgeInsets.only(
                    bottom: 130, left: 15, right: 15, top: 15),
                child: TransactionsHolder(
                  id: attendant.id,
                )),
          ),
        ],
      ),
    );
  }
}

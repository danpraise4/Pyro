// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuleap/api/account/account.dart';
import 'package:fuleap/api/api.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/models/attendats/attendants_model.dart';
import 'package:fuleap/provider/attendants_provider.dart';
import 'package:fuleap/screen/attendance/add_attendance.dart';
import 'package:fuleap/widget/general/attendant.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:fuleap/widget/general/extras.dart';
import 'package:fuleap/widget/general/shadow_box.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../../widget/general/app_bar.dart';

// ignore: camel_case_types
class allAttendance extends StatefulWidget {
  const allAttendance({super.key});

  @override
  State<allAttendance> createState() => _allAttendanceState();
}

// ignore: camel_case_types
class _allAttendanceState extends State<allAttendance> {
  updateAttendants() async {
    if (getStorage(path: db_attandance) != null) {
      Provider.of<AttendantsProvider>(context, listen: false)
          .updateAttendantsProvider(getAttendants()!);
    }
    await AccountApi(context)
        .GetAccount(Endpoints.getAttendance, storage: db_attandance, body: {});

    Provider.of<AttendantsProvider>(context, listen: false)
        .updateAttendantsProvider(getAttendants()!);
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration.zero, () => updateAttendants());
  }

  @override
  Widget build(BuildContext context) {
    AttentantsModel? accountModel =
        context.watch<AttendantsProvider>().attendants;

    return wrapPage(
      inScroll: false,
      isLoading: accountModel == null,
      appBar: customAppBar(context).titleAppBar(title: attendants, actions: [
        commonButtons(context).headerButton(
            text: "Add New",
            icon: const Icon(Icons.add),
            onClick: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const addAttendants()));
            })
      ]),
      children: Container(
        child: shadowBox(context,
            margin: const EdgeInsets.only(
                bottom: 130, left: 15, right: 15, top: 15),
            child: accountModel?.data?.length == 0
                ? Empty()
                : ListView.builder(
                    itemCount: accountModel?.data?.length ?? 0,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (a, index) {
                      return attendantItem(
                        index: index,
                        attendant: accountModel!.data![index],
                      );
                    })),
      ),
    );
  }
}

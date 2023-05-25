import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/helpers/utils.dart';
import 'package:fuleap/screen/settings/notifacations.dart';
import 'package:fuleap/widget/general/profile_image.dart';

// ignore: camel_case_types
class customAppBar {
  BuildContext context;

  customAppBar(this.context);

  Widget titleAppBar(
      {bool? canGoBack, required String? title, List<Widget>? actions}) {
    return Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Navigator.canPop(context)
                ? const Icon(
                    Icons.arrow_back,
                    color: black_,
                  )
                : const SizedBox(),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: const TextStyle(color: black_, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: actions == null
                ? []
                : List<Widget>.generate(
                    actions.length, (index) => actions[index]),
          )
        ]));
  }

  Widget profileAppBar({bool? canGoBack, bool showScan = true}) {
    return Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Navigator.canPop(context)
                ? const Icon(
                    Icons.arrow_back,
                    color: black_,
                  )
                : const SizedBox(),
          ),
          profileImage(
            w: 50,
            h: 50,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, ${getUser()?.user?.firstName ?? "User"}",
                    style: const TextStyle(color: black_, fontSize: 15),
                  ),
                  const Text(
                    "Have a fun day at work",
                    style: TextStyle(
                      color: black_,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              showScan
                  ? GestureDetector(
                      onTap: () {
                        showQRCode(context, uid: "3456783456");
                      },
                      child: SvgPicture.asset('${svgPath}scan_code.svg'))
                  : const SizedBox(),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const noticationHome()));
                  },
                  child: SvgPicture.asset('${svgPath}notification.svg'))
            ],
          )
        ]));
  }
}

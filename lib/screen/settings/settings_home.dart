import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/screen/authentication/login.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/profile_image.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

import '../../widget/general/icons.dart';

class settingsHome extends StatefulWidget {
  const settingsHome({super.key});

  @override
  State<settingsHome> createState() => _settingsHomeState();
}

class _settingsHomeState extends State<settingsHome> {
  List<Map<String, dynamic>> options = [
    {
      "title": 'Push notification',
      'state': false,
      'action': (context) {},
    },
    {
      "title": 'Turn on location',
      'state': false,
      'action': (context) {},
    },
    {
      "title": 'Account',
      'action': (context) {},
    },
    {
      "title": 'Transaction Pin',
      'action': (context) {},
    },
    {
      "title": 'Lock app',
      'action': (context) {},
    },
    {
      "title": 'Change password',
      'action': (context) {},
    },
    {
      "title": 'Terms and Condition',
      'action': (context) {},
    },
    {
      "title": 'Privacy and policy',
      'action': (context) {},
    },
    {
      "title": 'Help and support',
      'action': (context) {},
    }
  ];

  @override
  Widget build(BuildContext context) {
    return wrapPage(
        appBar: customAppBar(context).titleAppBar(title: "Settings"),
        children: Column(
          children: [
            Stack(
              children: [
                profileImage(
                  w: 100,
                  h: 100,
                ),
                Positioned(
                  right: 0,
                  bottom: 2,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: white_, borderRadius: inputeRadius),
                    child: Edit(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Tosan Tata",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Ref-FL-678901982",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 10,
                ),
                Copy()
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: List<Widget>.generate(options.length, (index) {
                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            options[index]["title"],
                          ),
                          (options[index]["state"]) == null
                              ? const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              : FlutterSwitch(
                                  width: 30.0,
                                  height: 15.0,
                                  valueFontSize: 25.0,
                                  toggleSize: 10.0,
                                  value: options[index]["state"],
                                  borderRadius: 30.0,
                                  padding: 2.0,
                                  showOnOff: false,
                                  onToggle: (val) {
                                    setState(() {
                                      options[index]["state"] = val;
                                    });
                                  },
                                )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const Login()),
                    (route) => false);
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Logout",
                    ),
                    Icon(
                      Icons.logout,
                      size: 20,
                      color: Colors.red.shade800,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/storage.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/helpers/utils.dart';
import 'package:fuleap/screen/authentication/change_password.dart';
import 'package:fuleap/screen/authentication/login.dart';
import 'package:fuleap/screen/settings/help_and_support.dart';
import 'package:fuleap/screen/settings/privacy_policy.dart';
import 'package:fuleap/screen/settings/terms_and_conditions.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/inpute.dart';
import 'package:fuleap/widget/general/profile_image.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../widget/general/icons.dart';

class settingsHome extends StatefulWidget {
  const settingsHome({super.key});

  @override
  State<settingsHome> createState() => _settingsHomeState();
}

class _settingsHomeState extends State<settingsHome> {
  @override
  Widget build(BuildContext context) {
//
    bool pushState = getStorage(path: pushKey) ?? false;
    String pinState = getStorage(path: pinKey) ?? '';

    List<Map<String, dynamic>> options = [
      {
        "title": 'Push notification',
        'state': pushState,
        'action': (context) {},
        'for': [0, 1]
      },
      {
        "title": 'Transaction Pin',
        'action': (context) {
          var pinController = TextEditingController();
          int state = 0;

          showBarModalBottomSheet(
            expand: false,
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (_, set) {
                return Container(
                  height: 250,
                  color: white_,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            state == 0
                                ? pinState.isEmpty
                                    ? "Enter PIN"
                                    : "Enter Old PIN to in order to set new one"
                                : "Enter new PIN",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: pinPut(
                            size: 4,
                            controller: pinController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (pinState.isEmpty) {
                                    setStorage(
                                        key: pinKey, value: pinController.text);
                                    Navigator.pop(context);
                                    showMessage(context,
                                        title: "Updated",
                                        message:
                                            "PIN is has been set Successfully",
                                        buttonText: "Close");
                                    return;
                                  } else {
                                    if (pinController.text == pinState &&
                                        state == 0) {
                                      set(() {
                                        state = 1;
                                        pinController.text = "";
                                      });
                                    } else {
                                      setStorage(
                                          key: pinKey,
                                          value: pinController.text);
                                      Navigator.pop(context);
                                      showMessage(context,
                                          title: "Updated",
                                          message:
                                              "PIN is has been set Successfully",
                                          buttonText: "Close");
                                    }

                                    setState(() {});
                                  }
                                },
                                child: const Text(
                                  "Confirm",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
            },
          );
        },
        'for': [0]
      },
      {
        "title": 'Lock app',
        'action': (context) {
          showBarModalBottomSheet(
            expand: false,
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (_, set) {
                bool pinState_ = getStorage(path: pinStateKey) ?? false;
                bool bioState_ = getStorage(path: bioKey) ?? false;
                return Container(
                  height: 250,
                  color: white_,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: const Text(
                            "Authentication",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('${svgPath}password.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "PIN",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            FlutterSwitch(
                              width: 30.0,
                              height: 15.0,
                              valueFontSize: 25.0,
                              toggleSize: 10.0,
                              value: pinState_,
                              borderRadius: 30.0,
                              padding: 2.0,
                              showOnOff: true,
                              onToggle: (val) {
                                set(() {
                                  if (pinState.isNotEmpty) {
                                    setStorage(key: pinStateKey, value: val);
                                  } else {
                                    showMessage(context,
                                        title: "PIN not set",
                                        message: "Set a transaction PIN first",
                                        buttonText: "Close");
                                  }
                                });
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('${svgPath}finger.svg'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "Finger print / Face ID",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            FlutterSwitch(
                              width: 30.0,
                              height: 15.0,
                              valueFontSize: 25.0,
                              toggleSize: 10.0,
                              value: bioState_,
                              borderRadius: 30.0,
                              padding: 2.0,
                              showOnOff: true,
                              onToggle: (val) {
                                set(() {
                                  if (pinState.isNotEmpty) {
                                    setStorage(key: bioKey, value: val);
                                  } else {
                                    showMessage(context,
                                        title: "PIN not set",
                                        message: "Set a transaction PIN first",
                                        buttonText: "Close");
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          );
        },
        'for': [1, 0]
      },
      {
        "title": 'Change password',
        'action': (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const changePassword()));
        },
        'for': [1, 0]
      },
      {
        "title": 'Terms and Condition',
        'action': (context) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const termsOfUse()));
        },
        'for': [
          0,
        ]
      },
      {
        "title": 'Privacy and policy',
        'action': (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const privacyPolicy()));
        },
        'for': [0]
      },
      {
        "title": 'Help and support',
        'action': (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const helpAndSupport()));
        },
        'for': [1, 0]
      }
    ];

    List<Map<String, dynamic>> mine = [];
    options.forEach(
      (element) {
        print(getRole().index);
        if ((element["for"] as List<int>).contains(getRole().index)) {
          mine.add(element);
        }
      },
    );
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
            Text(
              '${getUser()?.user?.firstName} ${getUser()?.user?.lastName}',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  getUser()!.user!.systemCode!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 10,
                ),
                Copy(val: getUser()!.user!.systemCode!, context: context)
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: List<Widget>.generate(mine.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (mine[index]["action"] != null) {
                        mine[index]["action"](context);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            mine[index]["title"],
                          ),
                          (mine[index]["state"]) == null
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
                                      setStorage(key: pushKey, value: val);
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/constants.dart';

class BottomNavigation {
  BuildContext context;
  List<Map<String, dynamic>> nav = [
    {"title": "Home", "icon": "${svgPath}bt_home.svg"},
    {"title": "Attendant", "icon": "${svgPath}bt_attendant.svg"},
    {"title": "Wallet", "icon": "${svgPath}bt_wallet.svg"},
    {"title": "Support", "icon": "${svgPath}bt_support.svg"},
    {"title": "Settings", "icon": "${svgPath}bt_settings.svg"}
  ];
  BottomNavigation(this.context);
  Widget BottomNav(int selected, {required Function? onClick}) {
    return Container(
        height: 110,
        padding: const EdgeInsets.only(bottom: 40),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: green_),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(nav.length, (index) {
              return InkWell(
                onTap: () {
                  if (onClick == null) {
                    return;
                  }
                  onClick(index);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: selected != index
                            ? null
                            : BoxDecoration(
                                color: lighGreen2_,
                                borderRadius: BorderRadius.circular(20)),
                        child: SvgPicture.asset(
                          nav[index]["icon"],
                          width: 20,
                          height: 20,
                        )),
                    Text(
                      nav[index]["title"],
                      style: const TextStyle(color: lightGreen_, fontSize: 12),
                    ),
                  ],
                ),
              );
            }),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/utils.dart';
import 'package:fuleap/widget/general/text_wrap.dart';

Widget singleProducts({required data}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        h1Text(data["title"], color: Colors.blueGrey),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: boxText(
                formatAmount(data["price"]),
                label: perLitter,
                hint: "",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: FlutterSwitch(
                width: 35.0,
                height: 20.0,
                valueFontSize: 30.0,
                toggleSize: 20.0,
                value: false,
                borderRadius: 30.0,
                padding: 3.0,
                showOnOff: false,
                onToggle: (val) {},
              ),
            )
          ],
        )
      ],
    ),
  );
}

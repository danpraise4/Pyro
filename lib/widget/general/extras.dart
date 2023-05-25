import 'package:flutter/material.dart';

Widget Empty() {
  return Container(
    height: 400,
    alignment: Alignment.center,
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Nothing here yet",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Text(
          "Go back to wallet and start transacting Ejor",
          style: TextStyle(fontWeight: FontWeight.w400),
        )
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';

Widget shadowBox(BuildContext context,
    {required Widget child,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        color: white_,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-1, 0),
            spreadRadius: 12,
            blurRadius: 9,
            color: Color.fromRGBO(244, 244, 244, 1),
          )
        ]),
    padding:
        padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: margin ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: child,
  );
}

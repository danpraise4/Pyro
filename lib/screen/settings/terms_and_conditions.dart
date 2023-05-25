import 'package:flutter/material.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

class termsOfUse extends StatefulWidget {
  const termsOfUse({super.key});

  @override
  State<termsOfUse> createState() => _termsOfUseState();
}

class _termsOfUseState extends State<termsOfUse> {
  @override
  Widget build(BuildContext context) {
    return wrapPage(
        appBar:
            customAppBar(context).titleAppBar(title: "Terms and Conditions"),
        children: Container());
  }
}

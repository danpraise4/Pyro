import 'package:flutter/material.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/extras.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

class privacyPolicy extends StatefulWidget {
  const privacyPolicy({super.key});

  @override
  State<privacyPolicy> createState() => _privacyPolicyState();
}

class _privacyPolicyState extends State<privacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return wrapPage(
        appBar: customAppBar(context).titleAppBar(title: "Privacy Policy"),
        children: Container());
  }
}

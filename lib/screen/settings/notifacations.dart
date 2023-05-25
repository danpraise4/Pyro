import 'package:flutter/material.dart';
import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/extras.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

class noticationHome extends StatefulWidget {
  const noticationHome({super.key});

  @override
  State<noticationHome> createState() => _noticationHomeState();
}

class _noticationHomeState extends State<noticationHome> {
  @override
  Widget build(BuildContext context) {
    return wrapPage(
        appBar: customAppBar(context).titleAppBar(title: "Notication"),
        children: Empty());
  }
}

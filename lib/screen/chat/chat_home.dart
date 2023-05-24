import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuleap/widget/chats/ticket_item.dart';
import 'package:fuleap/widget/general/shadow_box.dart';
import 'package:fuleap/widget/page/page_wrap.dart';

import '../../helpers/constants.dart';
import '../../widget/chats/chat_item.dart';
import '../../widget/general/app_bar.dart';

// ignore: camel_case_types
class chatHome extends StatefulWidget {
  const chatHome({super.key});

  @override
  State<chatHome> createState() => _chatHomeState();
}

// ignore: camel_case_types
class _chatHomeState extends State<chatHome> with TickerProviderStateMixin {
  var tabController;

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return wrapPage(
      inScroll: false,
      hasBackground: true,
      appBar: customAppBar(context).titleAppBar(
          title: "Live Support",
          actions: [SvgPicture.asset('${svgPath}notification.svg')]),
      children: Container(
        child: shadowBox(context,
            margin: const EdgeInsets.only(
                bottom: 120, left: 15, right: 15, top: 15),
            child: Column(
              children: [
                TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: "Chats",
                    ),
                    Tab(
                      text: "Tickets",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(controller: tabController, children: [
                    ListView.builder(
                        itemCount: 17,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (a, index) {
                          return const chatItem();
                        }),
                    ListView.builder(
                        itemCount: 17,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (a, index) {
                          return const ticketItem();
                        }),
                  ]),
                ),
              ],
            )),
      ),
    );
  }
}

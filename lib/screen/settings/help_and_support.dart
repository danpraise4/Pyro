import 'package:flutter/material.dart';

import 'package:fuleap/widget/general/app_bar.dart';
import 'package:fuleap/widget/general/extras.dart';
import 'package:fuleap/widget/page/page_wrap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../helpers/constants.dart';

class helpAndSupport extends StatefulWidget {
  const helpAndSupport({super.key});

  @override
  State<helpAndSupport> createState() => _helpAndSupportState();
}

class _helpAndSupportState extends State<helpAndSupport> {
  var textController = TextEditingController();
  String query = '';

  List<Map<String, String>>? models;
  List<Map<String, String>>? searh;

  GetBanks() async {
    models = [
      {
        "title": "How to reset my password",
        "body":
            "If you've forgotten your password, you can reset it by clicking on the 'Forgot Password' link on the login page. Follow the instructions provided to reset your password and regain access to your account."
      },
      {
        "title": "How to contact customer support",
        "body":
            "If you need assistance or have any questions, you can reach our customer support team by calling our toll-free number at 1-800-123-4567. Our support representatives are available 24/7 to help you."
      },
      {
        "title": "How to update my account information",
        "body":
            "To update your account information, log in to your account and navigate to the 'Account Settings' page. From there, you can edit your personal details, change your email address, or update your payment information."
      },
      {
        "title": "How to track my order",
        "body":
            "To track your order, go to the 'Order Tracking' section on our website. Enter your order number and email address associated with the order, and you'll be able to view the status and tracking information for your shipment."
      }
    ];

    setState(() {
      searh = models;
    });
  }

  SingleHelp({required Map<String, String> help}) {
    return GestureDetector(
      onTap: () {
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
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          help["title"]!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        child: Text(
                          help["body"]!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(children: [Text(help["title"]!)])),
            Divider()
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    GetBanks();
  }

  @override
  Widget build(BuildContext context) {
    return wrapPage(
        inScroll: false,
        appBar: customAppBar(context).titleAppBar(title: "Help and support"),
        children: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: white_,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(-1, 0),
                      spreadRadius: 12,
                      blurRadius: 9,
                      color: Color.fromRGBO(244, 244, 244, 1),
                    )
                  ]),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(Icons.search),
                  ),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (x) {
                        if (models == null) {
                          return;
                        }
                        searh = [];
                        models!.forEach((element) {
                          if (element["title"]!
                                  .toLowerCase()
                                  .contains(x.toLowerCase()) ||
                              element["body"]!
                                  .toLowerCase()
                                  .contains(x.toLowerCase())) {
                            searh!.add(element);
                          }
                        });

                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          hintText: "Search", border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: models == null
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : models!.isEmpty
                        ? Empty()
                        : ListView.builder(
                            itemCount: searh!.length,
                            itemBuilder: (_, x) {
                              return SingleHelp(help: searh![x]);
                            }))
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/widget/general/profile_image.dart';

class chatItem extends StatefulWidget {
  const chatItem({super.key});

  @override
  State<chatItem> createState() => _chatItemState();
}

class _chatItemState extends State<chatItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              profileImage(),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 140),
                    child: const Text(
                      "Welcome to the work od like and love we love you here . thanks.",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: blueGray_),
                    ),
                  ),
                  const Text(
                    "James - 2 months ago",
                    style: TextStyle(color: blue_, fontWeight: FontWeight.w500),
                  )
                ],
              )
            ]),
          ),
          Divider(
            color: blueGray_.shade100,
          )
        ],
      ),
    );
  }
}

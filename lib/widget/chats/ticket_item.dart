import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/widget/general/profile_image.dart';

class ticketItem extends StatefulWidget {
  const ticketItem({super.key});

  @override
  State<ticketItem> createState() => _ticketItemState();
}

class _ticketItemState extends State<ticketItem> {
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
                      "I cant find my wallet ID",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: green_),
                    ),
                  ),
                  const Text(
                    "Ticket ID - 54565 - Profile",
                    style: TextStyle(color: blue_, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "James - 2 months ago",
                    style: TextStyle(
                        color: blueGray_.shade300, fontWeight: FontWeight.w500),
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

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/models/attendats/attendants_model.dart';
import 'package:fuleap/widget/general/profile_image.dart';

class attendantItem extends StatefulWidget {
  attendantItem({super.key, required this.index, required this.attendant});

  int index;
  Data attendant;

  @override
  State<attendantItem> createState() => _attendantItemState();
}

// ignore: camel_case_types
class _attendantItemState extends State<attendantItem> {
  @override
  void initState() {
    super.initState();
    log(widget.attendant.toJson().toString());
  }

  @override
  Widget build(BuildContext context) {
    bool isActive = widget.attendant.accountStatus ?? true;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/view', arguments: widget.attendant);
      },
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.index % 2 == 0 ? lightGray_ : white_),
        child: Row(children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: profileImage()),
          Container(
            margin: const EdgeInsets.only(right: 20),
            color: white_,
            height: double.infinity,
            width: 3,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.attendant.firstName} ${widget.attendant.lastName}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    widget.attendant.systemCode!,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                        color: isActive
                            ? Colors.green.shade700.withOpacity(.3)
                            : Colors.red.shade700.withOpacity(.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      isActive ? "Active" : "Disabled",
                      style: TextStyle(
                          color: isActive
                              ? Colors.green.shade800
                              : Colors.red.shade800,
                          fontWeight: FontWeight.w300,
                          fontSize: 13),
                    ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.only(right: 14),
                child: const Icon(Icons.more_vert)),
          )
        ]),
      ),
    );
  }
}

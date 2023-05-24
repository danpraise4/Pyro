import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/utils.dart';

import '../../models/wallet/transaction_model.dart';
import '../../screen/wallet/wallet_view_transaction.dart';

// ignore: camel_case_types
class history extends StatefulWidget {
  history({super.key, required this.index, required this.data});

  int index;
  Data data;
  @override
  State<history> createState() => _historyState();
}

// ignore: camel_case_types
class _historyState extends State<history> {
  @override
  Widget build(BuildContext context) {
    String date =
        DateTime.parse(widget.data.createdAt!).format('MMMM dd y, h:mm a');
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => const walletViewTransactionHistory()));
      },
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.index % 2 == 0 ? lightGray_ : white_),
        child: Row(children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.green.shade700.withOpacity(.3),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.green.shade800,
                    size: 20,
                  ))),
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
                  widget.data.meta!.payerName!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "${widget.data!.category!.replaceAll("_", " ")} / ${date}",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 14),
              child: Text(
                "₦ ${formatAmount(widget.data.amount)}",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

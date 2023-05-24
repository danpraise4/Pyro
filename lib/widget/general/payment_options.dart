import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/models/wallet/payment_options_model.dart';

// ignore: camel_case_types
class paymentOption extends StatefulWidget {
  paymentOption(this.model,
      {super.key, required this.index, this.onClick, this.selected});

  Function? onClick;
  int? selected;
  int index;
  paymentOptionsModel model;

  @override
  State<paymentOption> createState() => _paymentOptionState();
}

// ignore: camel_case_types
class _paymentOptionState extends State<paymentOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onClick == null) {
          return;
        }
        widget.onClick!(widget.index);
      },
      child: widget.model.type == 'card'
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: lightGray_.withOpacity(.2),
                  borderRadius: BorderRadius.circular(15),
                  border: (containerBorder)),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    decoration:
                        BoxDecoration(color: gray_, borderRadius: inputeRadius),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.model.bank!),
                      Text('**** **** ${widget.model.number!.substring(6)}')
                    ],
                  )),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        color: widget.index == widget.selected
                            ? green_
                            : Colors.transparent,
                        borderRadius: inputeRadius,
                        border: inputeBorder),
                  )
                ],
              ),
            )
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Fund by transfer   "),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: widget.index == widget.selected
                                ? green_
                                : Colors.transparent,
                            borderRadius: inputeRadius,
                            border: inputeBorder),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: lightGray_.withOpacity(.2),
                        borderRadius: BorderRadius.circular(15),
                        border: (containerBorder)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(right: 10, top: 5),
                          decoration: BoxDecoration(
                              color: gray_, borderRadius: inputeRadius),
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Account Number",
                              style: TextStyle(fontSize: 11, color: gray_),
                            ),
                            Text(widget.model.number!),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Bank Name",
                              style: TextStyle(
                                fontSize: 11,
                                color: gray_,
                              ),
                            ),
                            Text(
                              widget.model.bank!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Account Number",
                              style: TextStyle(fontSize: 11, color: gray_),
                            ),
                            Text(widget.model.user!)
                          ],
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

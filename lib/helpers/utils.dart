import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/widget/general/button.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

String formatAmount(var number) {
  var formatter = NumberFormat("#,##0", "en_US");
  return formatter.format(number);
}

showMessage(context,
    {required String title,
    required message,
    onClick,
    required String buttonText}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (onClick == null) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pop(context);
                          onClick();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "    $buttonText    ",
                          style: TextStyle(
                              color: red_, fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    ),
                  ),
                )
              ]),
        );
      });
}

showQRCode(context, {required String uid}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  padding: const EdgeInsets.all(40),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(children: [
                    QrImage(
                      padding: const EdgeInsets.all(0),
                      data: "dadadadadadm  ssdadaa",
                      version: QrVersions.auto,
                      foregroundColor: black_,
                      size: 200.0,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            uid,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: blue_, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.copy,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                    customButton(
                        onClick: () {
                          Navigator.pop(context);
                        },
                        type: BottonType.small,
                        isActive: true,
                        isLoading: false,
                        text: "DONE")
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                )
              ]),
        );
      });
}

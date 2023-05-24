import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/utils.dart';
import 'package:fuleap/models/wallet/parse_transaction_model.dart';
import 'package:fuleap/widget/general/shadow_box.dart';
import 'package:fuleap/widget/general/text_wrap.dart';

class transactionCard extends StatefulWidget {
  transactionCard(
      {super.key,
      required this.model,
      this.hasShadow = false,
      this.canDownloadInvoice = false});

  parseTransactionModel model;
  bool hasShadow;
  bool canDownloadInvoice;

  @override
  State<transactionCard> createState() => _transactionCardState();
}

class _transactionCardState extends State<transactionCard> {
  singleRow({required Data data}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data.mKey!,
            style:
                const TextStyle(fontWeight: FontWeight.w400, color: blueGray_),
          ),
          Row(
            children: [
              Text(
                data.isAmount! ? formatAmount(data.mValue) : data.mValue!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              (data.copy ?? false)
                  ? GestureDetector(
                      child: const Icon(Icons.copy),
                    )
                  : const SizedBox()
            ],
          )
        ],
      ),
    );
  }

  rowsData(parseTransactionModel model) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        model.message == null ? const SizedBox() : Text(model.message!),
        Text(
          model.title!,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: List<Widget>.generate(model.data!.length,
                (index) => singleRow(data: model.data![index])),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            amountText(widget.model.total, form: AmountForm.form2),
          ],
        ),
        widget.canDownloadInvoice
            ? Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.download_done,
                      color: blue_,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Download recipet",
                      style: TextStyle(color: blue_),
                    ),
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.hasShadow
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 20),
      child: widget.hasShadow
          ? shadowBox(context,
              padding: !widget.hasShadow
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(horizontal: 20),
              child: rowsData(widget.model))
          : rowsData(widget.model),
    );
  }
}

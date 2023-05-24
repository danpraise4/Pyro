import 'package:flutter/material.dart';
import 'package:fuleap/helpers/myemums.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/helpers/utils.dart';

import '../../helpers/constants.dart';

h1Text(String text, {Color color = darkBlue_}) {
  return Text(
    text,
    style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 15),
  );
}

amountText(amount,
    {required AmountForm form,
    bool showVisiblility = false,
    double fontSize = 20,
    Color color = black_}) {
  return Container(
    child: Row(children: [
      form == AmountForm.form2
          ? Text(
              "NGN ",
              style: TextStyle(
                  color: color, fontSize: 14, fontWeight: FontWeight.w700),
            )
          : const SizedBox(),
      Text(
        "${form == AmountForm.form1 || form == AmountForm.form3 ? '₦ ' : ''}${formatAmount(amount)}",
        style: form == AmountForm.form1 || form == AmountForm.form2
            ? TextStyle(
                color: color, fontSize: fontSize, fontWeight: FontWeight.w700)
            : TextStyle(
                color: color, fontSize: 13, fontWeight: FontWeight.w500),
      ),
      showVisiblility
          ? Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.visibility,
                    color: color,
                    size: 18,
                  ),
                ),
              ],
            )
          : const SizedBox()
    ]),
  );
}

analysisText(
    {value,
    title,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    CrossAxisAlignment? crossAxisAlignment}) {
  return Container(
    margin: margin ?? const EdgeInsets.symmetric(),
    padding: padding ?? const EdgeInsets.symmetric(),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 13, color: blueGray_),
          )
        ]),
  );
}

boxText(String? text,
    {String? label, onClick, isEnabled = true, required String hint}) {
  return GestureDetector(
    onTap: () {
      if (onClick == null) {
        return;
      }
      if (!isEnabled) {
        return;
      }
      onClick();
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: lightGreen_,
              border: inputeBorder,
              borderRadius: inputeRadius),
          child: Text(
            text ?? hint,
            style: TextStyle(color: text == null ? gray_ : black_),
          ),
        ),
        label == null
            ? const SizedBox()
            : Text(
                label,
                style: const TextStyle(color: gray_, fontSize: 12),
              )
      ],
    ),
  );
}

////////////----------------

class inputeText extends StatefulWidget {
  inputeText(this.value,
      {super.key,
      required this.hint,
      this.required = false,
      this.inputeType = TextInputType.text,
      this.label,
      this.more = false,
      this.defaultVisibility = false,
      this.padding,
      this.icon = const SizedBox()});
  String? value;
  TextInputType inputeType;
  String? label;
  String hint;
  bool required;

  EdgeInsetsGeometry? padding;

  bool more;
  Widget icon;
  bool defaultVisibility;

  @override
  State<inputeText> createState() => _inputeTextState();
}

// ignore: camel_case_types
class _inputeTextState extends State<inputeText> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    isVisible = widget.defaultVisibility;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(widget.label!),
                      widget.required
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                Icons.star_rate,
                                color: Colors.red.shade700,
                                size: 10,
                              ))
                          : const SizedBox()
                    ],
                  ),
                )
              : const SizedBox(),
          Container(
            padding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                color: lightBlue_,
                borderRadius: inputeRadius,
                border: inputeBorder),
            child: Row(children: [
              widget.icon,
              Expanded(child: Text(widget.value ?? widget.hint)),
              widget.more
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: gray_,
                        size: 15,
                      ),
                    )
                  : const SizedBox()
            ]),
          ),
        ],
      ),
    );
  }
}

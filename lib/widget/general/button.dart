import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/theme.dart';

import '../../helpers/myemums.dart';

class customButton extends StatefulWidget {
  customButton(
      {super.key,
      required this.isActive,
      required this.isLoading,
      this.onClick,
      required this.text,
      this.color = green_,
      this.textColor = white_,
      this.margin,
      this.type = BottonType.large});

  bool isLoading;
  bool isActive;
  Function? onClick;
  String text;
  BottonType type;
  Color textColor;
  Color color;

  EdgeInsets? margin;

  @override
  State<customButton> createState() => _customButtonState();
}

// ignore: camel_case_types
class _customButtonState extends State<customButton> {
  bool isActive = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      isActive = false;
    } else {
      isActive = widget.isActive;
    }
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          return;
        }
        if (widget.onClick != null) {
          widget.onClick!();
        }
      },
      child: Container(
        alignment: widget.type == BottonType.large ? Alignment.center : null,
        width: widget.type == BottonType.large
            ? MediaQuery.of(context).size.width
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        margin: widget.margin ??
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: inputeRadius,
            color: isActive ? widget.color : green_.withOpacity(.2)),
        child: widget.isLoading
            ? const CircularProgressIndicator.adaptive()
            : Text(
                widget.text,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(color: white_, fontWeight: FontWeight.w700),
              ),
      ),
    );
  }
}

//------------------------

class borderButton extends StatefulWidget {
  borderButton(
      {super.key,
      required this.isActive,
      required this.isLoading,
      this.onClick,
      required this.text,
      this.type = BottonType.large});

  bool isLoading;
  bool isActive;
  Function? onClick;
  String text;
  BottonType type;

  @override
  State<borderButton> createState() => _borderButtonState();
}

// ignore: camel_case_types
class _borderButtonState extends State<borderButton> {
  bool isActive = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      isActive = false;
    } else {
      isActive = widget.isActive;
    }
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          return;
        }
        if (widget.onClick != null) {
          widget.onClick!();
        }
      },
      child: Container(
        alignment: widget.type == BottonType.large ? Alignment.center : null,
        width: widget.type == BottonType.large
            ? MediaQuery.of(context).size.width
            : null,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: blueGray_, width: 2),
            borderRadius: inputeRadius,
            color: isActive ? white_ : green_.withOpacity(.2)),
        child: widget.isLoading
            ? const CircularProgressIndicator.adaptive()
            : Text(
                widget.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: blueGray_, fontWeight: FontWeight.w700),
              ),
      ),
    );
  }
}

class commonButtons {
  BuildContext context;
  commonButtons(this.context);

  Widget headerButton({required String text, Widget? icon, onClick}) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 2,
              color: darkBlue_,
            )),
        child: Row(
          children: [icon ?? const SizedBox(), Text(text)],
        ),
      ),
    );
  }

  //
  Widget actionButton(
      {Function? onClick, required String title, required String icon}) {
    return GestureDetector(
      onTap: () {
        if (onClick == null) {
          return;
        }

        onClick(context);
      },
      child: Column(children: [
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: white_, borderRadius: BorderRadius.circular(15)),
          child: SvgPicture.asset("$svgPath$icon.svg"),
        ),
        Text(
          title,
          style: const TextStyle(color: white_),
        )
      ]),
    );
  }
}

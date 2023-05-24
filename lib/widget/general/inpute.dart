import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:pinput/pinput.dart';

import '../../helpers/theme.dart';

class inputeField extends StatefulWidget {
  inputeField(this.controller,
      {super.key,
      required this.hint,
      this.required = false,
      this.inputeType = TextInputType.text,
      this.label,
      this.showVisibilityTogle = false,
      this.defaultVisibility = false,
      this.validator,
      this.icon = const SizedBox()});
  TextEditingController controller;
  TextInputType inputeType;
  String? label;
  String hint;
  bool required;
  var validator;

  bool showVisibilityTogle;
  Widget icon;
  bool defaultVisibility;

  @override
  State<inputeField> createState() => _inputeFieldState();
}

// ignore: camel_case_types
class _inputeFieldState extends State<inputeField> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    isVisible = widget.defaultVisibility;
  }

  borderDecoration({bool isError = false}) {
    return OutlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: isError ? Colors.red.shade800 : gray_),
      borderRadius: inputeRadius,
    );
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
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            // decoration: BoxDecoration(
            //     color: lightBlue_,
            //     borderRadius: inputeRadius,
            //     border: inputeBorder
            //     ),
            child: Row(children: [
              widget.icon,
              Expanded(
                  child: TextFormField(
                controller: widget.controller,
                obscureText: isVisible,
                validator: widget.validator,
                decoration: InputDecoration(
                  fillColor: lightBlue_,
                  filled: true,
                  suffixIcon: widget.showVisibilityTogle
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Icon(
                            isVisible ? Icons.visibility_off : Icons.visibility,
                            color: gray_,
                          ),
                        )
                      : const SizedBox(),
                  hintText: widget.hint,
                  hintStyle: hintStyle,
                  enabledBorder: borderDecoration(),
                  border: borderDecoration(),
                  errorBorder: borderDecoration(isError: true),
                  focusedBorder: borderDecoration(),
                  focusedErrorBorder: borderDecoration(isError: true),
                ),
              )),
            ]),
          ),
        ],
      ),
    );
  }
}

/// ===========
///

class pinPut extends StatefulWidget {
  pinPut(
      {Key? key,
      required this.controller,
      this.enabled = true,
      this.hide = false})
      : super(key: key);

  TextEditingController controller;
  bool? enabled;
  bool? hide;

  @override
  State<pinPut> createState() => _pinPutState();
}

class _pinPutState extends State<pinPut> {
  Pin({controller}) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(234, 239, 243, 1),
        border: inputeBorder,
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      controller: controller,
      enabled: widget.enabled!,
      readOnly: !widget.enabled!,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return null;

        // return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
      obscureText: widget.hide!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Pin(controller: widget.controller);
  }
}

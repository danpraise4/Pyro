import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class saveBeneficary extends StatefulWidget {
  saveBeneficary({super.key, this.onChange, this.text});

  Function? onChange;
  String? text;
  @override
  State<saveBeneficary> createState() => _saveBeneficaryState();
}

class _saveBeneficaryState extends State<saveBeneficary> {
  bool currentState = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Text(widget.text ?? "Save as benficiary"),
          const SizedBox(
            width: 10,
          ),
          FlutterSwitch(
            width: 30.0,
            height: 15.0,
            valueFontSize: 25.0,
            toggleSize: 10.0,
            value: currentState,
            borderRadius: 30.0,
            padding: 2.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {
                currentState = val;
                if (widget.onChange == null) {
                  return;
                }
                widget.onChange!(currentState);
              });
            },
          )
        ],
      ),
    );
  }
}

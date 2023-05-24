import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';
import 'package:fuleap/helpers/theme.dart';
import 'package:fuleap/helpers/utils.dart';

Widget amountPicker(BuildContext context,
    {required List amounts,
    bool hasMax = false,
    Function? onChange,
    Function? onMax}) {
  Widget singleItem(Widget item) {
    return Container(
      width: 110,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: lightGray_.withOpacity(.2), borderRadius: inputeRadius),
      child: item,
    );
  }

  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 100,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          hasMax
              ? GestureDetector(
                  onTap: () {
                    if (onMax == null) {
                      return;
                    }
                    onMax();
                  },
                  child: singleItem(const Text(
                    "Max",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  )),
                )
              : const SizedBox(),
          SizedBox(
            height: 55,
            child: ListView.builder(
                itemCount: amounts.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (x, index) {
                  return GestureDetector(
                    onTap: () {
                      if (onChange == null) {
                        return;
                      }
                      onChange(amounts[index]);
                    },
                    child: Container(
                        child: singleItem(Text(
                      formatAmount(amounts[index]),
                      style:
                          const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ))),
                  );
                }),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    ),
  );
}

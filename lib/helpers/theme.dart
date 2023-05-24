import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';

BoxDecoration pathDecoration = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("${imagesPath}path.png"), fit: BoxFit.cover));

BoxDecoration patternDecoration = const BoxDecoration(
  image: DecorationImage(
      image: AssetImage("${imagesPath}pattern.png"), fit: BoxFit.cover),
);

Widget fuleapLogo({
  double w = 100,
  double h = 100,
  bool showMore = false,
}) {
  return Column(children: [
    Image.asset(
      "${imagesPath}logo1.png",
      width: w,
      height: h,
    ),
    showMore ? fluleapLogoMore() : const SizedBox()
  ]);
}

Widget fluleapLogoMore() {
  return const Column(
    children: [
      SizedBox(
        height: 20,
      ),
      Text(
        signIn,
        style:
            TextStyle(color: green_, fontWeight: FontWeight.w700, fontSize: 30),
      ),
      Text(
        belovedCustoemr,
        style:
            TextStyle(color: gray_, fontWeight: FontWeight.w400, fontSize: 13),
      ),
    ],
  );
}

Border inputeBorder = Border.all(color: gray_);
Border containerBorder = Border.all(color: lightGray_);
BorderRadius inputeRadius = BorderRadius.circular(8);
TextStyle hintStyle = const TextStyle(
  color: gray_,
  fontWeight: FontWeight.w300,
);

import 'package:flutter/material.dart';
import 'package:fuleap/helpers/constants.dart';

import '../../helpers/theme.dart';

class FuleapSplash {
  FuleapSplash();

  fuleapWelcome() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        fuleapLogo(h: 120, w: 120),
        const Text(
          "Fuleap",
          style: TextStyle(
              color: white_, fontSize: 48, fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}

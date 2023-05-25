import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuleap/helpers/utils.dart';

import '../../helpers/constants.dart';

Copy({width, height, val, message, context}) => GestureDetector(
    onTap: () async {
      if (val != null) {
        await Clipboard.setData(ClipboardData(text: val));
        showToast(context, "Done");
      }
    },
    child: SvgPicture.asset('${svgPath}copy.svg'));
Notification({width, height}) => SvgPicture.asset('${svgPath}copy.svg');
Edit({width, height}) => SvgPicture.asset('${svgPath}edit.svg');
Code({width, height}) => SvgPicture.asset('${svgPath}copy.svg');

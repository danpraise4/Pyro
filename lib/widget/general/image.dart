import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

Widget Base64Image({required String data, double h = 200, double w = 200}) {
  Uint8List _bytesImage;

  String _imgString = data.split(",")[1];

  _bytesImage = const Base64Decoder().convert(_imgString);

  return Image.memory(
    _bytesImage,
    height: h,
    width: w,
    fit: BoxFit.cover,
  );
}

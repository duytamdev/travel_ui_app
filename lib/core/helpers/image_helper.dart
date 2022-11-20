import 'package:flutter/material.dart';

class ImageHelper {
  static Widget loadFromAssets(
      String path,
      {
        double? width,
        double? height,
        BorderRadius? radius,
        BoxFit? fit,
        Color? color,
        AlignmentGeometry? alignment,
      }) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.asset(
        path,
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: alignment??Alignment.center,
      ),
    );
  }
  static String getAssetImage(String name) {
    return 'assets/images/$name';
  }
}
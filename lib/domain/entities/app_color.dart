import 'package:flutter/material.dart';

import '../../core/constants.dart';

class AppColor {
  const AppColor(this.value);

  final Color value;

  Color contrastingText() {
    final double luminance = value.computeLuminance();
    return luminance > AppConstants.luminanceThreshold
        ? Colors.black
        : Colors.white;
  }

}

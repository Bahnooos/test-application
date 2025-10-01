import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../entities/app_color.dart';

abstract class GenerateRandomColor {
  AppColor call();
}

class GenerateRandomColorImpl implements GenerateRandomColor {
  GenerateRandomColorImpl({Random? random}) : _random = random ?? Random();

  final Random _random;

  @override
  AppColor call() {
    final int maxExclusive = AppConstants.maxChannelValue + 1;
    final int red = _random.nextInt(maxExclusive);
    final int green = _random.nextInt(maxExclusive);
    final int blue = _random.nextInt(maxExclusive);
    return AppColor(Color.fromARGB(AppConstants.opaqueAlpha, red, green, blue));
  }
}

import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../domain/entities/app_color.dart';
import '../../domain/usecases/generate_random_color.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  _ColorPageState()
    : _generateRandomColor = GenerateRandomColorImpl(),
      _currentColor = const AppColor(Colors.white);

  final GenerateRandomColor _generateRandomColor;
  AppColor _currentColor;

  void _onTapChangeColor() {
    setState(() {
      _currentColor = _generateRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color background = _currentColor.value;
    final Color textColor = _currentColor.contrastingText();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTapChangeColor,
      child: Scaffold(
        backgroundColor: background,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: AppConstants.animationMs),
          curve: Curves.easeInOut,
          color: background,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Hello there',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppConstants.spaceSmall),
                Text(
                  'Tap anywhere to change the color',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor.withOpacity(
                      AppConstants.instructionOpacity,
                    ),
                  ),
                ),
                const SizedBox(height: AppConstants.spaceMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

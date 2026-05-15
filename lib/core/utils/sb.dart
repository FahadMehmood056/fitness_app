import 'package:flutter/material.dart';

class SB extends StatelessWidget {
  final double? height;
  final double? width;

  const SB.h(this.height, {super.key}) : width = null;
  const SB.w(this.width, {super.key}) : height = null;
  const SB.hw(this.height, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}

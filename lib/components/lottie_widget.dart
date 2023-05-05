import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatefulWidget {
  final String path;
  const LottieWidget({super.key, required this.path});

  @override
  State<LottieWidget> createState() => _LottieWidgetState();
}

class _LottieWidgetState extends State<LottieWidget> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(widget.path);
  }
}

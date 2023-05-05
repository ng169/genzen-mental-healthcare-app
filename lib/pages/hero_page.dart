import 'package:flutter/material.dart';
import 'package:mental_health/components/lottie_widget.dart';

import 'package:mental_health/components/motivation_widget.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({super.key});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LottieWidget(
          path: 'assets/animations/43792-yoga-se-hi-hoga.json',
        ),
        MotivationWidget(),
      ],
    );
  }
}

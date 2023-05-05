import 'package:flutter/material.dart';
import 'package:mental_health/components/lottie_widget.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> {
  bool isStarted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          isStarted
              ? LottieWidget(path: 'assets/animations/breathing.json')
              : Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isStarted = true;
                      });
                    },
                    child: Text('Start'),
                  ),
                ),
          isStarted
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isStarted = false;
                    });
                  },
                  child: Text('Stop'))
              : SizedBox(),
        ],
      ),
    );
  }
}

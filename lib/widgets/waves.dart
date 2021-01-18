import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Waves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WaveWidget(
        config: CustomConfig(
          gradients: [
            [Color(0xfffce4ec), Color(0xfff8bbd0), Color(0xfff48fb1)],
            [
              Color(0xfffce4ec),
              Color(0xfff8bbd0),
              Color(0xffec407a),
            ],
            [
              Color(0xfffce4ec),
              Color(0xfff8bbd0),
              Color(0xffd81b60),
            ]
          ],
          durations: [19440, 10800, 6000],
          heightPercentages: [0.03, 0.01, 0.02],
          gradientBegin: Alignment.bottomCenter,
          gradientEnd: Alignment.topCenter,
        ),
        size: Size(
          double.infinity,
          double.infinity,
        ),
        backgroundColor: Color(0xfffce4ec));
  }
}

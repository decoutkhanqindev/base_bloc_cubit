import 'package:flutter/material.dart';
import 'package:timer_app/screens/components/timer_background.dart';
import 'package:timer_app/screens/components/timer_controll_button.dart';
import 'package:timer_app/screens/components/timer_text.dart';

class TimerBody extends StatelessWidget {
  const TimerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        TimerBackground(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 100.0),
              child: Center(child: TimerText()),
            ),
            TimerControllButton()
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:timer_app/screens/components/timer_body.dart';

class TimerContent extends StatelessWidget {
  const TimerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: TimerBody());
  }
}

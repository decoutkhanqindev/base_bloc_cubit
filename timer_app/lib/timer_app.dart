import 'package:flutter/material.dart';
import 'package:timer_app/screens/timer_screen.dart';

/// A [TimerApp] extends [StatelessWidget] to serve as the root of the counter application.
class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TimerScreen());
  }
}

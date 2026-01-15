import 'package:counter_app/screens/counter_screen.dart';
import 'package:flutter/material.dart';

/// A [CounterApp] extends [StatelessWidget] to serve as the root of the counter application.
class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterScreen());
  }
}

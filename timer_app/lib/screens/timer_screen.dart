import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/data/ticker.dart';
import 'package:timer_app/screens/bloc/timer_bloc.dart';
import 'package:timer_app/screens/components/timer_content.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerContent(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/screens/bloc/timer_bloc.dart';

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (duration % 60).toString().padLeft(2, '0');

    return Text(
      '$minutes:$seconds',
      style: const TextStyle(
        fontSize: 120,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

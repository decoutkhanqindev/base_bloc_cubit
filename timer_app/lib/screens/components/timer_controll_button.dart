import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/screens/bloc/timer_bloc.dart';
import 'package:timer_app/screens/bloc/timer_event.dart';
import 'package:timer_app/screens/bloc/timer_state.dart';

class TimerControllButton extends StatelessWidget {
  const TimerControllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...switch (state) {
              TimerInitial() => [
                  FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.blueGrey,
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () => context
                        .read<TimerBloc>()
                        .add(TimerStarted(duration: state.duration)),
                  ),
                ],
              TimerInProgress() => [
                  FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.blueGrey,
                    child: const Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerPaused()),
                  ),
                  FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.blueGrey,
                    child: const Icon(
                      Icons.replay,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerReset()),
                  ),
                ],
              TimerPause() => [
                  FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.blueGrey,
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerResumed()),
                  ),
                  FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.blueGrey,
                    child: const Icon(
                      Icons.replay,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerReset()),
                  ),
                ],
              TimerComplete() => [
                  FloatingActionButton(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.blueGrey,
                    child: const Icon(
                      Icons.replay,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerReset()),
                  ),
                ],
            }
          ],
        );
      },
    );
  }
}

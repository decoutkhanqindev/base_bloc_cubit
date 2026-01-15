import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/data/ticker.dart';
import 'package:timer_app/screens/bloc/timer_event.dart';
import 'package:timer_app/screens/bloc/timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const int _duration = 60;
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<TimerTicked>(_onTicked);
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerInProgress(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTicked(duration: duration)));
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is! TimerInProgress) return;
    _tickerSubscription?.pause();
    emit(TimerPause(state.duration));
  }

  void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state is! TimerPause) return;
    _tickerSubscription?.resume();
    emit(TimerInProgress(state.duration));
  }

  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(const TimerInitial(_duration));
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerInProgress(event.duration)
          : const TimerComplete(),
    );
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}

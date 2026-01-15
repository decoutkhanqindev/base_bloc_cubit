import 'package:equatable/equatable.dart';

sealed class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);
}

final class TimerInProgress extends TimerState {
  const TimerInProgress(super.duration);
}

final class TimerPause extends TimerState {
  const TimerPause(super.duration);
}

final class TimerComplete extends TimerState {
  const TimerComplete() : super(0);
}

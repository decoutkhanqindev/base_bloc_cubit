import 'package:bloc/bloc.dart';

/// A [CounterCubit] extends [Cubit] to manage the state of a counter.
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

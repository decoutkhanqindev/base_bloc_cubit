import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

// use object state
// class CounterCubit extends Cubit<CounterState> {
//   CounterCubit() : super(CounterInitial());
// }

// use normal state
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// use object state
// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterInitial()) {
//     on<CounterEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

// use normal state
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>((event, emit) => emit(state + 1));
  }
}

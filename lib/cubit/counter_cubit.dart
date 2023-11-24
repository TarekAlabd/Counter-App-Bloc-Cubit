import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(const CounterState(
          value: 0,
          hasIncremented: false,
        ));

  void increment() {
    emit(CounterState(
      value: state.value + 1,
      hasIncremented: true,
    ));
  }

  void decrement() {
    emit(CounterState(
      value: state.value >= 1 ? state.value - 1 : 0,
      hasIncremented: false,
    ));
  }
}

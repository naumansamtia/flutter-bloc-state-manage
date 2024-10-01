import 'package:bloc/bloc.dart';
import 'package:counter_app_bloc/bloc/counter/counter_event.dart';
import 'package:counter_app_bloc/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCount>(_increment);
    on<DecrementCount>(_decrement);
  }

  void _increment(IncrementCount event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(count: state.count + 1),
    );
  }

  void _decrement(DecrementCount event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(count: state.count - 1),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CountEvent {}

class IncrementCount extends CountEvent {}

//state
class CounterState {
  final int count;
  CounterState(this.count);
}

// bloc

class CounterBloc extends Bloc<CountEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementCount>((event, emit) {
      emit(CounterState(state.count + 1));
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

// Event
abstract class OptionCalculatorEvent {}

class AddEvent extends OptionCalculatorEvent {
  final double a;
  final double b;
  AddEvent(this.a, this.b);
}

class SubtractEvent extends OptionCalculatorEvent {
  final double a;
  final double b;
  SubtractEvent(this.a, this.b);
}

class MultiplyEvent extends OptionCalculatorEvent {
  final double a;
  final double b;
  MultiplyEvent(this.a, this.b);
}

class DivideEvent extends OptionCalculatorEvent {
  final double a;
  final double b;
  DivideEvent(this.a, this.b);
}

// State
abstract class OptionCalculatorState {}

class InitialState extends OptionCalculatorState {}

class ResultState extends OptionCalculatorState {
  final String result;
  ResultState(this.result);
}

// Bloc
class OptionCalculatorBloc
    extends Bloc<OptionCalculatorEvent, OptionCalculatorState> {
  OptionCalculatorBloc() : super(InitialState()) {
    on<AddEvent>((event, emit) {
      final result = "${event.a} + ${event.b} = ${event.a + event.b}";
      emit(ResultState(result));
    });

    on<SubtractEvent>((event, emit) {
      final result = "${event.a} - ${event.b} = ${event.a - event.b}";
      emit(ResultState(result));
    });

    on<MultiplyEvent>((event, emit) {
      final result = "${event.a} * ${event.b} = ${event.a * event.b}";
      emit(ResultState(result));
    });

    on<DivideEvent>((event, emit) {
      if (event.b != 0) {
        final result = "${event.a} / ${event.b} = ${event.a / event.b}";
        emit(ResultState(result));
      } else {
        emit(ResultState("Cannot divide by zero"));
      }
    });
  }
}

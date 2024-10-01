import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCount extends CounterEvent {}

class DecrementCount extends CounterEvent {}

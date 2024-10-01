
import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable{
  SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotifi extends SwitchEvent{}
class SliderValues extends SwitchEvent{
  final double slider;
  SliderValues({required this.slider});
  @override
  List<Object> get props => [slider];
}
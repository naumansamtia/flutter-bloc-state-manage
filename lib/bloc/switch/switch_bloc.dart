import 'package:bloc/bloc.dart';
import 'package:counter_app_bloc/bloc/switch/switch_State.dart';
import 'package:counter_app_bloc/bloc/switch/switch_event.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc() :super(SwitchState()){
    on<EnableOrDisableNotifi>(_enableOrDisableNotifi);
    on<SliderValues>(_sliderValue);
  }

  void _enableOrDisableNotifi( EnableOrDisableNotifi event, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
  void _sliderValue( SliderValues event, Emitter<SwitchState> emit){
    emit(state.copyWith(slider: event.slider));
  }
}
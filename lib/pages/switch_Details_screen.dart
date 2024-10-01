import 'package:counter_app_bloc/bloc/switch/switch_State.dart';
import 'package:counter_app_bloc/bloc/switch/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/switch/switch_event.dart';

class SwitchDetailsScreen extends StatefulWidget {
  const SwitchDetailsScreen({super.key});

  @override
  State<SwitchDetailsScreen> createState() => _SwitchDetailsScreenState();
}

class _SwitchDetailsScreenState extends State<SwitchDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Switch Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification'),
                BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      return Switch(
                          value: state.isSwitch,
                          onChanged: (newValue) {
                            print(newValue);
                            context
                                .read<SwitchBloc>()
                                .add(EnableOrDisableNotifi());
                          });
                    }),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            }),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  return Slider(
                      value: state.slider,
                      onChanged: (value) {
                        print(value);
                        context
                            .read<SwitchBloc>()
                            .add(SliderValues(slider: value));
                      });
                }),
          ],
        ),
      ),
    );
  }
}

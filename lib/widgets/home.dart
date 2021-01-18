import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'actions.dart';
import 'waves.dart';
import 'package:timer_app/bloc/timer_state.dart';
import 'package:timer_app/bloc/timer_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Timer',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Playfair Display',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Waves(),
          ListView(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 300),
              child: Center(
                child: BlocBuilder<TimerBloc, TimerState>(
                  builder: (context, state) {
                    final String minutesSection = ((state.duration / 60) % 60)
                        .floor()
                        .toString()
                        .padLeft(2, '0');
                    final secondsSection = (state.duration % 60)
                        .floor()
                        .toString()
                        .padLeft(2, '0');
                    return Text(
                      '$minutesSection : $secondsSection ',
                      style: TextStyle(
                          fontSize: 65,
                          fontFamily: 'Playfair Display',
                          color: Colors.white),
                    );
                  },
                ),
              ),
            ),
            BlocBuilder<TimerBloc, TimerState>(
              buildWhen: (previousState, currentState) =>
              currentState.runtimeType != previousState.runtimeType,
              builder: (context, state) => ActionsButtons(),
            ),
          ])
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/bloc/timer_bloc.dart';
import 'package:timer_app/bloc/timer_event.dart';
import 'package:timer_app/bloc/timer_state.dart';

class ActionsButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _mapStateToActionButtons(
          timerBloc: BlocProvider.of<TimerBloc>(context)),
    );
  }

  List<Widget> _mapStateToActionButtons({TimerBloc timerBloc}) {
    final TimerState currentState = timerBloc.state;
    if (currentState is Ready) {
      return [
        FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              timerBloc.add(Start(duration: currentState.duration));
            })
      ];
    }
    if (currentState is Running) {
      return [
        FloatingActionButton(
            child: Icon(Icons.pause),
            onPressed: () {
              timerBloc.add(Pause());
            }),
        FloatingActionButton(
            child: Icon(Icons.replay),
            onPressed: () {
              timerBloc.add(Reset());
            })
      ];
    }
    if (currentState is Paused) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            timerBloc.add(Resume());
          },
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () {
            timerBloc.add(Reset());
          },
        )
      ];
    }
    if (currentState is Finished) {
      return [
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () {
            timerBloc.add(Reset());
          },
        )
      ];
    }
    return [];
  }
}

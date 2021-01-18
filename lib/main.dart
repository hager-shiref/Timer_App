import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/bloc/bloc.dart';
import 'bloc/timer_bloc.dart';
import 'ticker.dart';
import 'widgets/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xfff48fb1),
          accentColor: Color(0xfff8bbd0),
          brightness: Brightness.dark),
      home: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: Home(),
      ),
    );
  }
}


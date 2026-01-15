import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/timer_app.dart';
import 'package:timer_app/timer_observer.dart';

void main() {
  Bloc.observer = const TimerObserver();
  runApp(const TimerApp());
}

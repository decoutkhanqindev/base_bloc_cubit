import 'package:counter_app/screens/cubits/counter_cubit.dart';
import 'package:counter_app/screens/components/counter_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [CounterScreen] extends [StatelessWidget] to display the counter and
/// provides [CounterCubit] to the widget tree.
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const CounterContent(),
    );
  }
}

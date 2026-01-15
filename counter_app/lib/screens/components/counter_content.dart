import 'package:counter_app/screens/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A [CounterContent] extends [StatelessWidget] to display the counter and
/// allows the user to increment or decrement it using [CounterCubit].
class CounterContent extends StatelessWidget {
  const CounterContent({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(
              state.toString(),
              style: textTheme.headlineLarge,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            backgroundColor: Colors.lightBlueAccent,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            backgroundColor: Colors.lightBlueAccent,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

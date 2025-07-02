import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
}

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData.light();

  static final _darkTheme = ThemeData.dark();

  void changeTheme() => emit(state == _lightTheme ? _darkTheme : _lightTheme);
}

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (context) => CounterCubit()),
    //     BlocProvider(create: (context) => ThemeCubit()),
    //   ],
    //   child: MaterialApp(home: SafeArea(child: Scaffold())),
    // );

    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        home: SafeArea(child: Scaffold(body: AppBody())),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      // reuse for child screen or dialog, ...
      value: BlocProvider.of<CounterCubit>(context),
      child: Center(),
    );
  }
}

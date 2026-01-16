import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/screens/bloc/infinite_list_bloc.dart';
import 'package:infinite_list/screens/bloc/infinite_list_event.dart';
import 'package:infinite_list/screens/components/infinite_content.dart';

class InfiniteListScreen extends StatelessWidget {
  const InfiniteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InfiniteListBloc()..add(GetList()),
      child: const InfiniteContent(),
    );
  }
}

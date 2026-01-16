import 'package:flutter/material.dart';
import 'package:infinite_list/screens/infinite_list_screen.dart';

class InfiniteListApp extends StatelessWidget {
  const InfiniteListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: InfiniteListScreen());
  }
}

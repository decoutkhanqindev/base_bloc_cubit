import 'package:flutter/material.dart';

class InfiniteListBottomLoader extends StatelessWidget {
  const InfiniteListBottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(strokeWidth: 1.5),
        ),
      ),
    );
  }
}

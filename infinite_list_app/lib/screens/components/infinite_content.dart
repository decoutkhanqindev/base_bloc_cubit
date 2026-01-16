import 'package:flutter/material.dart';
import 'package:infinite_list/screens/components/infinite_list_body.dart';

class InfiniteContent extends StatelessWidget {
  const InfiniteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Posts",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 4,
      ),
      body: const InfiniteListBody(),
    );
  }
}

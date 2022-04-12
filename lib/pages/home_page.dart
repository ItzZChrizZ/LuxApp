// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          const Center(
            child: Text("Home Page"),
          ),
          Container(
            child: const Text("Action Bar"),
          ),
        ],
      ),
    );
  }
}

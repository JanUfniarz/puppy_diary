import 'package:flutter/material.dart';

class PuppyView extends StatelessWidget {
  const PuppyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 40),
        CircleAvatar(
          radius: 80,
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:puppy_diary/controllers/puppy_view_controller.dart';
import 'package:puppy_diary/types/function_types.dart';

AppViewBuilder puppyView = (context, controller) => Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    const SizedBox(height: 40),
    const CircleAvatar(
      radius: 80,
    ),

    _InfoOrInput<String>(controller.dog?.name),

    _InfoOrInput<String>(controller.dog?.fullName),

  ],
);

class _InfoOrInput<T> extends StatelessWidget {
  final T? value;

  const _InfoOrInput(this.value, {super.key});

  @override
  Widget build(BuildContext context) => value == null
      ? const SizedBox()
      : Text(value.toString());
}

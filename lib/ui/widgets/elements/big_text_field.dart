import 'package:flutter/material.dart';

class BigTextField extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? label;

  const BigTextField({super.key, this.initialValue, this.onChanged, this.label});

  @override
  Widget build(BuildContext context) => TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      maxLines: 3,
    );
}

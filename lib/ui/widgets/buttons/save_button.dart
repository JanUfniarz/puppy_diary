import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const SaveButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) => FilledButton.icon(
    onPressed: onPressed,
    icon: Icon(
      Icons.save,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    label: Text('Save',
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    ),
    style: FilledButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primary,
    ),
  );
}

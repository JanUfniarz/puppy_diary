import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const DeleteButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) => FilledButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.delete),
      label: const Text('Delete'),
      style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
      ),
    );
}

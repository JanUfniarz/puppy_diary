import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const DeleteButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) => FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(
          Icons.delete,
        color: Theme.of(context).colorScheme.onErrorContainer,
      ),
      label: Text('Delete',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onErrorContainer,
        ),
      ),
      style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
      ),
    );
}

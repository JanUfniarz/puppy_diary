import 'package:flutter/material.dart';

class OutlinedCard extends StatelessWidget {
  final Widget child;
  const OutlinedCard({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Padding(
        padding: const EdgeInsets.all(10),
        child: child,
      ),
    );
}
import 'package:flutter/material.dart';

Future<T?> bottomSheet<T>(
  BuildContext context,
  Widget? child,
) => showModalBottomSheet<T>(
  context: context,
  isScrollControlled: true,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(24),
      topLeft: Radius.circular(24),
    ),
  ),
  builder: (context) => Padding(
    padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: SizedBox(
      height: 300,
      width: double.infinity,
      child: child,
    ),
  ),
);

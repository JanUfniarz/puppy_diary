import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final String label;
  final bool initialValue;
  final void Function(bool) onChanged;

  const SwitchButton({
    super.key,
    required this.label,
    this.initialValue = true,
    required this.onChanged
  });

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  late bool value = widget.initialValue;


  Widget get child => Text(widget.label);

  void onPressed() => setState(() {
      value = !value;
      widget.onChanged(value);
    });


  @override
  Widget build(BuildContext context) => value
      ? FilledButton(onPressed: onPressed, child: child)
      : OutlinedButton(onPressed: onPressed, child: child);
}

import 'package:flutter/material.dart';

class ToggleButtonsComponents extends StatelessWidget {
  const ToggleButtonsComponents(
      {super.key, required this.toggleValue, required this.onChanged});
  final bool toggleValue;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: toggleValue,
      onChanged: onChanged,
    );
  }
}

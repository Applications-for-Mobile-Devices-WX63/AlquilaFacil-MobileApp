import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../public/ui/theme/main_theme.dart';

class CapacityFilters extends StatefulWidget {
  final String range;
  const CapacityFilters({super.key, required this.range});

  @override
  State<CapacityFilters> createState() => _CapacityFiltersState();
}

class _CapacityFiltersState extends State<CapacityFilters> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
        children:[
          Checkbox(
            side: const BorderSide(color: Colors.black),
            shape: const CircleBorder(),
            value: isChecked,
            checkColor: Colors.white,
            activeColor: MainTheme.primary,
            onChanged: (bool? newValue) {
              setState(() {
                isChecked = newValue ?? false;
              });
            },
          ),
          Text(
            widget.range,
            style: TextStyle(
                color: MainTheme.contrast
            ),
          )
        ]
    );
  }
}

import 'package:flutter/material.dart';

class HighlightedCalendarDay extends StatelessWidget {
  final DateTime day;
  final Color color;

  const HighlightedCalendarDay({
    super.key,
    required this.day,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        // Color con opacidad para destacar suavemente
        border: Border.all(color: color, width: 1.5),
      ),
      alignment: Alignment.center,
      child: Text(
        '${day.day}',
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
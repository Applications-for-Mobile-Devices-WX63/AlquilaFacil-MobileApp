import 'package:alquilafacil/public/presentation/widgets/default_calendar_day.dart';
import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/event_type_indicator.dart';
import '../widgets/highlighted_calendar_day.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarScreenState();


}

class _CalendarScreenState extends State<CalendarScreen> {
  final DateTime _focusedDay = DateTime.now();

  // Listas de días a resaltar
  final List<DateTime> redDays = [
    DateTime.utc(2024, 9, 5),
    DateTime.utc(2024, 9, 12),
  ];

  final List<DateTime> blueDays = [
    DateTime.utc(2024, 9, 8),
    DateTime.utc(2024, 9, 15),
  ];

  final List<DateTime> yellowDays = [
    DateTime.utc(2024, 9, 10),
    DateTime.utc(2024, 9, 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text(
              "Toca en una fecha para ver más detalles sobre la programación",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16.0),
          TableCalendar(
            locale: "es_ES",
            rowHeight: 40.0,
            calendarStyle: const CalendarStyle(
              isTodayHighlighted: false,
              defaultTextStyle: TextStyle(color: Colors.grey),
              tableBorder: TableBorder(
                top: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey),
                left: BorderSide(color: Colors.grey),
                right: BorderSide(color: Colors.grey),
              ),
            ),
            headerStyle: const HeaderStyle(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  left: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey),
                ),
              ),
              titleTextStyle: TextStyle(color: Colors.black),
              formatButtonVisible: false,
              titleCentered: true,
            ),
            daysOfWeekHeight: 40.0,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2024, 09, 01),
            lastDay: DateTime.utc(2025, 09, 30),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                return DefaultCalendarDay(day: day);
              },
              outsideBuilder: (context, day, focusedDay) {
                return DefaultCalendarDay(day: day, isOutside: true);
              },
              markerBuilder: (context, day, events) {
                if (redDays.contains(day)) {
                  return HighlightedCalendarDay(day: day, color: Colors.red);
                } else if (blueDays.contains(day)) {
                  return HighlightedCalendarDay(day: day, color: Colors.blue);
                } else if (yellowDays.contains(day)) {
                  return HighlightedCalendarDay(
                      day: day, color: Colors.amberAccent);
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                EventTypeIndicator(color: Colors.red, text: "Reserva"),
                SizedBox(height: 16.0),
                EventTypeIndicator(color: Colors.blue, text: "Evento"),
                SizedBox(height: 16.0),
                EventTypeIndicator(
                    color: Colors.amberAccent, text: "Recordatorio"),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}

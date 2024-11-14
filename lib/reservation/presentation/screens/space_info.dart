import 'dart:ui';

import 'package:alquilafacil/profile/presentation/providers/pofile_provider.dart';
import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/reservation/presentation/widgets/space_info_actions.dart';
import 'package:alquilafacil/reservation/presentation/widgets/space_info_details.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../public/ui/theme/main_theme.dart';
import 'payment_screen.dart';

class SpaceInfo extends StatefulWidget {
  const SpaceInfo({super.key});
  @override
  State<StatefulWidget> createState() => _SpaceInfoState();
}

class _SpaceInfoState  extends State<SpaceInfo> {

  DateTime _focusedDay = DateTime.now();
  DateTime? _startDay;
  DateTime? _endDay;

  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  @override
  void initState() {
    super.initState();
    final profileProvider = context.read<ProfileProvider>();
    final spaceProvider = context.read<SpaceProvider>();
    () async {
      await profileProvider.fetchUsernameExpect(
          spaceProvider.spaceSelected!.userId!);
    }();
  }

  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart ? (_startTime ?? TimeOfDay.now()) : (_endTime ?? TimeOfDay.now()),
      builder: (BuildContext context, Widget? child) {
        return Theme(data: ThemeData(
            primaryColor: MainTheme.primary(context),
            colorScheme: ColorScheme.light(primary: MainTheme.secondary(context), secondary: MainTheme.secondary(context), onSurface: MainTheme.secondary(context)),

        ), child: child!);
      },
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    final profileProvider = context.watch<ProfileProvider>();
    return Scaffold(
        backgroundColor: MainTheme.background(context),
        appBar: AppBar(
          backgroundColor: MainTheme.primary(context),
          title: const Text("Información del espacio", style: TextStyle(color: Colors.white, fontSize: 18)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottomNavigationBar: const ScreenBottomAppBar(),
        body: SingleChildScrollView(
          child: spaceProvider.spaceSelected != null ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                spaceProvider.spaceSelected!.photoUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   SpaceInfoDetails(
                       localName: spaceProvider.spaceSelected!.localName,
                       capacity: spaceProvider.spaceSelected!.capacity,
                       username: profileProvider.usernameExpect,
                       description: spaceProvider.spaceSelected!.descriptionMessage,
                       streetAddress: spaceProvider.spaceSelected!.streetAddress,
                       cityPlace: spaceProvider.spaceSelected!.cityPlace,
                       isEditMode: false,
                       features: spaceProvider.spaceSelected!.features,
                   ),
                    const SizedBox(height: 20),
                    const SpaceInfoActions(),
                    const SizedBox(height: 20),
                     Text(
                        "Fecha:",
                      style: TextStyle(
                        color: MainTheme.contrast(context),
                        fontSize: 17
                      )
                    ),
                    const SizedBox(height: 10),
                    TableCalendar(
                      locale: "es_ES",
                      daysOfWeekHeight: 40.0,
                      focusedDay: _focusedDay,
                      firstDay: DateTime.utc(2024, 09, 01),
                      lastDay: DateTime.utc(2025, 09, 30),
                      selectedDayPredicate: (day) {
                        return _startDay != null &&
                            _endDay != null &&
                            (day.isAtSameMomentAs(_startDay!) || day.isAtSameMomentAs(_endDay!));
                      },
                      rangeSelectionMode: RangeSelectionMode.toggledOn,
                      rangeStartDay: _startDay,
                      rangeEndDay: _endDay,
                      onRangeSelected: (start, end, focusedDay) {
                        setState(() {
                          _startDay = start;
                          _endDay = end;
                          _focusedDay = focusedDay;
                        });
                      },
                      headerStyle: HeaderStyle(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey),
                            left: BorderSide(color: Colors.grey),
                            right: BorderSide(color: Colors.grey),
                          ),
                        ),
                        titleTextStyle: TextStyle(color: MainTheme.contrast(context)),
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      calendarStyle: CalendarStyle(

                        defaultTextStyle: TextStyle(color: MainTheme.contrast(context)),
                        selectedTextStyle: const TextStyle(color: Colors.amberAccent),
                        cellMargin: const EdgeInsets.all(0),
                        rangeHighlightColor: Colors.transparent,
                        disabledTextStyle: const TextStyle(color: Colors.grey),
                        rangeStartTextStyle: const TextStyle(
                          color: Colors.orange
                        ),
                       todayDecoration: BoxDecoration(
                           color: Colors.transparent,
                           shape: BoxShape.rectangle,
                           border:  Border.all(color: Colors.grey, width: 1)
                       ),
                       todayTextStyle: TextStyle(
                         color: MainTheme.contrast(context)
                       ),
                       selectedDecoration: BoxDecoration(
                           color: Colors.transparent,
                           shape: BoxShape.rectangle,
                           border:  Border.all(color: Colors.red, width: 1)
                       ),
                       rangeEndTextStyle: const TextStyle(
                            color: Colors.orange
                        ),
                        rangeStartDecoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.rectangle,
                          border:  Border.all(color: Colors.red, width: 1)
                        ),
                        withinRangeTextStyle: const TextStyle(
                            color: Colors.orange
                        ),
                        withinRangeDecoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.rectangle,
                            border:  Border.all(color: Colors.red, width: 1)
                        ),
                        rangeEndDecoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.rectangle,
                            border:  Border.all(color: Colors.red, width: 1)
                        ),

                      ),
                      daysOfWeekStyle:  DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: MainTheme.contrast(context), fontWeight: FontWeight.bold),
                        weekendStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              shape: BoxShape.rectangle,
                            ),
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: TextStyle(color: MainTheme.contrast(context)),
                              ),
                            ),
                          );
                        },
                        outsideBuilder: (context, day, focusedDay) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              color: Colors.transparent,
                              shape: BoxShape.rectangle,
                            ),
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          );
                        },
                        dowBuilder: (context, day) {
                          final text = DateFormat.E("es_ES").format(day);
                          final capitalizedText = text.replaceFirst(text[0], text[0].toUpperCase());
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              shape: BoxShape.rectangle,
                            ),
                            child: Center(
                                child:  Text(
                                  capitalizedText,
                                  style: TextStyle(
                                      color: MainTheme.contrast(context),
                                      fontWeight: FontWeight.bold,
                                    fontSize: 12
                                  ),
                                ),
                            ),
                          );
                        },
                      ),
                      calendarFormat: CalendarFormat.month,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                    ),
                  const SizedBox(height: 16.0),
                     Text(
                      'Horario:',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: MainTheme.contrast(context),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => _selectTime(context, true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              _startTime != null
                                  ? _startTime!.format(context)
                                  : 'Inicio',
                              style:  TextStyle(
                                  color: MainTheme.contrast(context), fontSize: 16),
                            ),
                          ),
                        ),
                         Text(
                            '-',
                            style: TextStyle(
                              fontSize: 30,
                              color: MainTheme.contrast(context)
                            )
                        ),
                        GestureDetector(
                          onTap: () => _selectTime(context, false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              _endTime != null
                                  ? _endTime!.format(context)
                                  : 'Fin',
                              style: TextStyle(
                                  color: MainTheme.contrast(context), fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_startDay == null || _endDay == null || _startTime == null || _endTime == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Por favor selecciona las fechas y horas de inicio y fin válidas')),
                            );
                            return;
                          }
                          final startDateTime = DateTime(
                            _startDay!.year,
                            _startDay!.month,
                            _startDay!.day,
                            _startTime!.hour,
                            _startTime!.minute,
                          );
                      
                          final endDateTime = DateTime(
                            _endDay!.year,
                            _endDay!.month,
                            _endDay!.day,
                            _endTime!.hour,
                            _endTime!.minute,
                          );
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => PaymentScreen(
                                    amount: spaceProvider.spaceSelected!.nightPrice,
                                    startDate: startDateTime.toIso8601String(),
                                    endDate:  endDateTime.toIso8601String(),
                                    localName: spaceProvider.spaceSelected!.localName,
                                    userId:  spaceProvider.spaceSelected!.userId!,
                                    localId:  spaceProvider.spaceSelected!.id,
                                  ))
                          );
                      
                      
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          minimumSize: const Size(350, 50),
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Reservar'),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ) : Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Text(
                "No hay espacio seleccionado",
                style: TextStyle(
                    color: MainTheme.contrast(context),
                    fontSize: 20.0
                ),
              ),
            ),
          ),
        )
    );
  }
}

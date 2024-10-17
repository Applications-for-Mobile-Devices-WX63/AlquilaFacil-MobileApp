
import 'package:alquilafacil/reservation/presentation/screens/payment_screen.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';

import '../providers/reservation_provider.dart';

class DetailsScreen extends StatefulWidget {
  final int localId;
  const DetailsScreen({Key? key, required this.localId}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isLoading = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _startDay; 
  DateTime? _endDay;   

  TimeOfDay? _startTime; 
  TimeOfDay? _endTime;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    final spaceProvider = context.read<SpaceProvider>();
    () async {
      try {
        await spaceProvider.fetchSpaceById(widget.localId);
      }  finally {
        setState(() {
          isLoading = false;
        });
      }
    }();
  }

  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart ? (_startTime ?? TimeOfDay.now()) : (_endTime ?? TimeOfDay.now()),
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
    final SpaceProvider spaceProvider = context.read<SpaceProvider>();
    final ReservationProvider reservationProvider = context.read<ReservationProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles')),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(
                          spaceProvider.spaceSelected!.photoUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/default_image.png',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          spaceProvider.spaceSelected!.localName,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          spaceProvider.spaceSelected!.cityPlace,
                          style: const TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Capacidad: ${spaceProvider.spaceSelected!.capacity} personas',
                          style: const TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Precio por noche: S/. ${spaceProvider.spaceSelected!.nightPrice}',
                          style: const TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Selecciona el rango de fechas:',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TableCalendar(
                          locale: "es_ES",
                          firstDay: DateTime.utc(2023, 1, 1),
                          lastDay: DateTime.utc(2025, 1, 1),
                          focusedDay: _focusedDay,
                          selectedDayPredicate: (day) {
                            return _startDay != null && _endDay != null &&
                                (day.isAtSameMomentAs(_startDay!) ||
                                 day.isAtSameMomentAs(_endDay!));
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
                          calendarStyle: CalendarStyle(
                            defaultTextStyle: const TextStyle(color: Colors.black),
                            weekendTextStyle: const TextStyle(color: Colors.red),
                            selectedTextStyle: const TextStyle(color: Colors.white),
                            rangeStartDecoration: const BoxDecoration(
                              color: Colors.orangeAccent,
                              shape: BoxShape.circle,
                            ),
                            rangeEndDecoration: const BoxDecoration(
                              color: Colors.orangeAccent,
                              shape: BoxShape.circle,
                            ),
                            rangeHighlightColor: Colors.orange.shade100,
                            todayDecoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              shape: BoxShape.circle,
                            ),
                            disabledTextStyle: const TextStyle(color: Colors.grey),
                          ),
                          headerStyle: const HeaderStyle(
                            titleTextStyle: TextStyle(color: Colors.black, fontSize: 16.0),
                            formatButtonTextStyle: TextStyle(color: Colors.black),
                            formatButtonDecoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
                            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
                          ),
                          calendarFormat: CalendarFormat.month,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Horario:',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  _startTime != null
                                      ? 'Inicio: ${_startTime!.format(context)}'
                                      : 'Inicio',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                            const Text('-'),
                            GestureDetector(
                              onTap: () => _selectTime(context, false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  _endTime != null
                                      ? 'Fin: ${_endTime!.format(context)}'
                                      : 'Fin',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                       ElevatedButton(
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
                            try {
                             Navigator.of(context).push(
                                 MaterialPageRoute(
                                     builder: (BuildContext context) => PaymentScreen(
                                       amount: spaceProvider.spaceSelected!.nightPrice,
                                       startDate: startDateTime.toIso8601String(),
                                       endDate:  endDateTime.toIso8601String(),
                                       localName: spaceProvider.spaceSelected!.localName,
                                       userId:  spaceProvider.spaceSelected!.userId,
                                       localId:  spaceProvider.spaceSelected!.id,
                                     ))
                             );

                            } finally{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Reserva realizada con éxito')),
                              );
                            }


                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.orange, 
                            foregroundColor: Colors.white,  
                          ),
                          child: const Text('Reservar'),
                        )

                      ],
                    ),
                  ),
                ),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}

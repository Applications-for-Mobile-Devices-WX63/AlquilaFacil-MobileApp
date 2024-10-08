/*
import 'package:alquilafacil/profile/domain/model/user.dart';
import 'package:alquilafacil/profile/infrastructure/services/users_service.dart';
import 'package:alquilafacil/public/presentation/widgets/default_calendar_day.dart';
import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/spaces/domain/model/space.dart';
import 'package:alquilafacil/reservation/model/reservation_arguments.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../spaces/data/remote/services/spaces_service.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  _ReservationScreen createState() => _ReservationScreen();
}

class _ReservationScreen extends State<ReservationScreen> {
  final SpaceService _spaceService = SpaceService();
  Space? space;
  final UserService _userService = UserService();

  late int spaceId;
  late String spaceName;
  late String spaceAddress;
  late int capacity;
  late String owner;
  late String description;
  late double price;

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  void initState() {
    super.initState();
    _loadSpaceData();
  }

  Future<void> _loadSpaceData() async {
    try {
      await _spaceService.init();
      await _userService.init();
      Space? loadedSpace = await _spaceService.getSpaceById(2);
      if (loadedSpace != null) {
        User? ownerUser = await _userService.getUserById(loadedSpace.ownerId); // Usa await aquí
        setState(() {
          space = loadedSpace;
          spaceId = space!.id;
          spaceName = space!.name;
          spaceAddress = space!.location;
          capacity = space!.capacity;
          owner = ownerUser != null ? ownerUser.name : 'Desconocido'; // Maneja el caso nulo
          description = space!.description;
          price = space!.price;
        });
      }
    } catch (e) {
      // Manejo de errores al cargar el espacio
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar el espacio: $e')),
      );
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? (startTime ?? TimeOfDay.now()) : (endTime ?? TimeOfDay.now()),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  void _validateAndNavigate() {
    if (startTime == null || endTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecciona la hora de inicio y fin.'), backgroundColor: Colors.red),
      );
    } else if (endTime!.hour < startTime!.hour ||
        (endTime!.hour == startTime!.hour && endTime!.minute <= startTime!.minute)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('La hora de fin debe ser después de la hora de inicio.'), backgroundColor: Colors.red),
      );
    } else if (_selectedDay == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecciona una fecha.'), backgroundColor: Colors.red),
      );

    } else {
      Navigator.pushNamed(context, '/reservation/confirmation', arguments: ReservationArguments(price: price, selectedDay: _selectedDay, startTime: startTime, endTime: endTime));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: space == null // Verificar si los datos del espacio están disponibles
          ? const Center(child: CircularProgressIndicator()) // Mostrar un cargador mientras se cargan los datos
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(spaceName, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24.0)),
              Text(spaceAddress, style: const TextStyle(color: Colors.black, fontSize: 16.0)),
              Text("Aforo: $capacity personas", style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
              const SizedBox(height: 16.0),
              Text("Propietario: $owner", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16.0),
              const Text("Descripción:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              Text(description, style: const TextStyle(color: Colors.black)),
              const SizedBox(height: 16.0),
              TextButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () => Navigator.pushNamed(context, '/comments', arguments: spaceId),
                child: const Text("Comentarios >", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ),
              TextButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: () => Navigator.pushNamed(context, '/details'),
                child: const Text("Detalles adicionales >", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16.0),
              const Text("Fecha:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              TableCalendar(
                locale: "es_ES",
                rowHeight: 40.0,
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: false,
                  defaultTextStyle: const TextStyle(color: Colors.black),
                  selectedTextStyle: const TextStyle(color: Colors.amberAccent),
                  selectedDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.red),
                    shape: BoxShape.circle,
                  ),
                  tableBorder: const TableBorder(
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
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                firstDay: DateTime.utc(2024, 09, 01),
                lastDay: DateTime.utc(2025, 09, 30),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    return DefaultCalendarDay(day: day);
                  },
                  outsideBuilder: (context, day, focusedDay) {
                    return DefaultCalendarDay(day: day, isOutside: true);
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              const Text("Hora:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _selectTime(context, true),
                    child: Text(startTime != null ? startTime!.format(context) : "Hora de inicio", style: const TextStyle(color: Colors.black)),
                  ),
                  const Text(" - ", style: TextStyle(color: Colors.black, fontSize: 32.0, fontWeight: FontWeight.w200)),
                  ElevatedButton(
                    onPressed: () => _selectTime(context, false),
                    child: Text(endTime != null ? endTime!.format(context) : "Hora de fin", style: const TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text("Mensaje (opcional):", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              const TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orangeAccent),
                  ),
                  hintText: "Mensaje",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: _validateAndNavigate,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.orangeAccent),
                  minimumSize: WidgetStateProperty.all(const Size(double.infinity, 70.0)),
                  shape: WidgetStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                child: const Text("Reservar", style: TextStyle(fontSize: 20.0)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}*/

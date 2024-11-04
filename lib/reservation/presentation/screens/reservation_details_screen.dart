
import 'package:alquilafacil/profile/presentation/providers/pofile_provider.dart';
import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/reservation/presentation/widgets/space_info_actions.dart';
import 'package:alquilafacil/reservation/presentation/widgets/space_info_details.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../public/ui/theme/main_theme.dart';
import '../../domain/model/reservation.dart';
import 'payment_screen.dart';

class ReservationDetailsScreen extends StatefulWidget {
  const ReservationDetailsScreen({super.key});
  @override
  State<StatefulWidget> createState() => _ReservationDetailsScreen();
}

class _ReservationDetailsScreen extends State<ReservationDetailsScreen> {

  late Reservation reservation;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reservation = ModalRoute.of(context)!.settings.arguments as Reservation;
  }

  @override
  void initState() {
    super.initState();
    final spaceProvider = context.read<SpaceProvider>();
    final profileProvider = context.read<ProfileProvider>();
    () async {
      await profileProvider.fetchUsernameExpect(
          spaceProvider.spaceSelected!.userId);
    }();
  }

  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    final profileProvider = context.watch<ProfileProvider>();
    return Scaffold(
        backgroundColor: MainTheme.background,
        appBar: AppBar(
          backgroundColor: MainTheme.primary,
          title: Text("Información de la reserva", style: TextStyle(color: MainTheme.background, fontSize: 18)),
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
                        cityPlace: spaceProvider.spaceSelected!.cityPlace
                    ),
                    const SizedBox(height: 20),
                    Text(
                        "Inicia el: ${DateFormat('dd/MM/yyyy').format(reservation.startDate)} a las ${DateFormat('HH:mm').format(reservation.startDate)}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15
                        )
                    ),
                    const SizedBox(height: 20),
                    Text(
                        "Termina el: ${DateFormat('dd/MM/yyyy').format(reservation.endDate)} a las ${DateFormat('HH:mm').format(reservation.endDate)}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15
                        )
                    ),
                    const SizedBox(height: 20),
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
                    color: MainTheme.contrast,
                    fontSize: 20.0
                ),
              ),
            ),
          ),
        )
    );
  }
}

import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const details = ['WiFi', 'TV', 'Cocina', 'Baño', 'Estacionamiento', 'Piscina', 'Gimnasio', 'Aire acondicionado', 'Calefacción', 'Mascotas'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles')),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Características:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                ...details.map((detail) { // Usamos el spread operator (...) para añadir los elementos de la lista generada por el map
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        const Icon(Icons.circle, color: Colors.black, size: 10.0),
                        const SizedBox(width: 10.0),
                        Text(
                          detail,
                          style: const TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 16.0),
                const Text(
                  'Políticas de cancelación:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Se permite la cancelación sin cargo adicional si se realiza con 48 horas de antelación. Cancelaciones dentro de las 24 horas anteriores a la reserva tendrán un cargo del 50% del total.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0
                  ),
                ),
              ],
            ),
          ),


      ),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}
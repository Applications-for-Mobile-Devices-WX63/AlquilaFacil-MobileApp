
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:alquilafacil/reservation/presentation/screens/space_info.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../providers/space_provider.dart';

class SpaceCard extends StatelessWidget {
  final String location;
  final String price;
  final String imageUrl;
  final int id;

  const SpaceCard({
    super.key,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    return GestureDetector(
      onTap: () async {
        await spaceProvider.fetchSpaceById(id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SpaceInfo(),
          ),
        );
      },
      child: Card(
        color: MainTheme.background, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'S/. $price',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      // Acción para el primer ícono
                    },
                    icon: const Icon(Icons.military_tech_rounded),
                    color: Colors.orange,
                    iconSize: 30.0,
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: ()  {

                    },
                    icon: const Icon(Icons.star),
                    color: Colors.orange,
                    iconSize: 30.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

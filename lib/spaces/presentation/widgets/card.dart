import 'package:alquilafacil/reservation/presentation/screens/details_screen.dart';
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  final String location;
  final String price;
  final String imageUrl;
  final int id; 

  const SpaceCard({
    Key? key,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.id, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(id: id, token: "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MjkyMjAzMDUsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL3NpZCI6IjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoicm9kMmFjIiwiaWF0IjoxNzI4NjE1NTA1LCJuYmYiOjE3Mjg2MTU1MDV9.hZrBDnxeemGSFfOR020zDGFCL02JA5c7kVoLXBJBALw"),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(id: id, token: "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MjkyMjAzMDUsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL3NpZCI6IjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoicm9kMmFjIiwiaWF0IjoxNzI4NjE1NTA1LCJuYmYiOjE3Mjg2MTU1MDV9.hZrBDnxeemGSFfOR020zDGFCL02JA5c7kVoLXBJBALw"),
                        ),
                      );
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

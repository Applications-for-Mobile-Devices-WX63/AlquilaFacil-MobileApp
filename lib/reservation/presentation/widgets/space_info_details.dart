import 'package:flutter/cupertino.dart';

import '../../../public/ui/theme/main_theme.dart';

class SpaceInfoDetails extends StatelessWidget {

  final String localName;
  final int capacity;
  final String username;
  final String description;
  final String streetAddress;
  final String cityPlace;
  const SpaceInfoDetails({
    super.key,
    required this.localName,
    required this.capacity,
    required this.username,
    required this.description,
    required this.streetAddress,
    required this.cityPlace
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Text(
          localName,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MainTheme.contrast,
              fontSize: 25.0
          ),
      ),
     Text(
        "$streetAddress $cityPlace",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: MainTheme.contrast,
              fontSize: 20.0
          ),
        ),
     Text(
        "Aforo: $capacity personas",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: MainTheme.helper,
          fontSize: 15.0
          ),
        ),
     const SizedBox(height: 30),
     Text(
     "Propietario: $username",
        textAlign: TextAlign.start,
       style: TextStyle(
          color: MainTheme.contrast,
          fontSize: 15.0
        ),
      ),
     const SizedBox(height: 30),
     Text(
       "Descripción:",
        style: TextStyle(
          color: MainTheme.contrast,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
       ),
    ),
    Text(
      description,
      style: TextStyle(
          color: MainTheme.contrast,
          fontSize: 20.0
         ),
       )
     ]
    );
  }
}

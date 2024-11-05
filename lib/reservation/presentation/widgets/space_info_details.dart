import 'package:alquilafacil/spaces/presentation/widgets/edit_space_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../public/ui/theme/main_theme.dart';
import '../../../spaces/presentation/providers/space_provider.dart';

class SpaceInfoDetails extends StatefulWidget {
  final String localName;
  final int capacity;
  final String username;
  final String description;
  final String streetAddress;
  final String cityPlace;
  final bool isEditMode;

  const SpaceInfoDetails({
    Key? key,
    required this.localName,
    required this.capacity,
    required this.username,
    required this.description,
    required this.streetAddress,
    required this.cityPlace,
    required this.isEditMode,
  }) : super(key: key);

  @override
  _SpaceInfoDetailsState createState() => _SpaceInfoDetailsState();
}

class _SpaceInfoDetailsState extends State<SpaceInfoDetails> {
  late TextEditingController localNameController;
  late TextEditingController capacityController;
  late TextEditingController descriptionController;
  late TextEditingController streetAddressController;
  late TextEditingController cityPlaceController;

  @override
  void initState() {
    super.initState();
    localNameController = TextEditingController(text: widget.localName);
    capacityController = TextEditingController(text: widget.capacity.toString());
    descriptionController = TextEditingController(text: widget.description);
    streetAddressController = TextEditingController(text: widget.streetAddress);
    cityPlaceController = TextEditingController(text: widget.cityPlace);
  }

  @override
  void dispose() {
    localNameController.dispose();
    capacityController.dispose();
    descriptionController.dispose();
    streetAddressController.dispose();
    cityPlaceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();

    return !widget.isEditMode
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.localName,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MainTheme.contrast,
              fontSize: 25.0),
        ),
        Text(
          "${widget.streetAddress} ${widget.cityPlace}",
          textAlign: TextAlign.start,
          style: TextStyle(color: MainTheme.contrast, fontSize: 18.0),
        ),
        Text(
          "Aforo: ${widget.capacity} personas",
          textAlign: TextAlign.start,
          style: TextStyle(color: MainTheme.helper, fontSize: 15.0),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Propietario: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MainTheme.contrast,
                  fontSize: 18.0,
                ),
              ),
              TextSpan(
                text: widget.username,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: MainTheme.contrast,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 20),
        Text(
          "Descripción:",
          style: TextStyle(
              color: MainTheme.contrast,
              fontWeight: FontWeight.bold,
              fontSize: 17.0),
        ),
        Text(
          widget.description,
          style: TextStyle(color: MainTheme.contrast, fontSize: 17.0),
        ),
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        EditSpaceField(
          controller: localNameController,
          onValueChanged: (value) =>
              spaceProvider.setLocalName(value),
          hintText: 'Nombre del local',
        ),
        EditSpaceField(
          controller: streetAddressController,
          onValueChanged: (value) =>
              spaceProvider.setStreetAddress(value),
          hintText: 'Dirección del local',
        ),
        EditSpaceField(
          controller: cityPlaceController,
          onValueChanged: (value) =>
              spaceProvider.setCityPlace(value),
          hintText: 'Distrito',
        ),
        EditSpaceField(
          controller: capacityController,
          onValueChanged: (value) {
            final intValue = int.tryParse(value);
            if (intValue != null && intValue >= 0) {
              spaceProvider.setCapacity(intValue);
            } else {
              capacityController.text = widget.capacity.toString();
            }
          },
          hintText: 'Aforo del local',
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Propietario: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MainTheme.contrast,
                  fontSize: 18.0,
                ),
              ),
              TextSpan(
                text: widget.username,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: MainTheme.contrast,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 20),
        Text(
          "Descripción:",
          style: TextStyle(
              color: MainTheme.contrast,
              fontWeight: FontWeight.bold,
              fontSize: 17.0),
        ),
        EditSpaceField(
          controller: descriptionController,
          onValueChanged: (value) =>
              spaceProvider.setDescription(value),
          hintText: 'Descripción del local',
        ),
      ],
    );
  }
}

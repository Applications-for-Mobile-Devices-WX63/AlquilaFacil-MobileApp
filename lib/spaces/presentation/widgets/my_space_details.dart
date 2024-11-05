import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../profile/presentation/providers/pofile_provider.dart';
import '../../../public/ui/theme/main_theme.dart';
import '../../../reservation/presentation/widgets/space_info_details.dart';
import '../providers/space_provider.dart';
import 'my_space_details_actions.dart';

class MySpaceDetails extends StatefulWidget {
  const MySpaceDetails({super.key});

  @override
  State<MySpaceDetails> createState() => _MySpaceDetailsState();
}

class _MySpaceDetailsState extends State<MySpaceDetails> {
  late TextEditingController _nightPriceController;
  late TextEditingController _featuresController;

  @override
  void initState() {
    super.initState();
    final spaceProvider = context.read<SpaceProvider>();

    _nightPriceController = TextEditingController(
        text: spaceProvider.spaceSelected!.nightPrice.toString());
    _featuresController = TextEditingController(
        text: spaceProvider.spaceSelected!.features);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final profileProvider = context.read<ProfileProvider>();
      await profileProvider.fetchUsernameExpect(spaceProvider.spaceSelected!.userId);
    });
  }

  @override
  void dispose() {
    _nightPriceController.dispose();
    _featuresController.dispose();
    super.dispose();
  }

  void _updateNightPrice() {
    final newPrice = double.tryParse(_nightPriceController.text);
    if (newPrice != null && newPrice >= 0) {
      context.read<SpaceProvider>().setCurrentPrice(newPrice);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa un precio válido.')),
      );
    }
  }

  void _updateFeatures() {
    final newFeatures = _featuresController.text;
    context.read<SpaceProvider>().setFeatures(newFeatures);
  }

  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    final profileProvider = context.watch<ProfileProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainTheme.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: MainTheme.background),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Mis espacios", style: TextStyle(color: MainTheme.background)),
      ),
      body: spaceProvider.spaceSelected != null
          ? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceProvider.isEditMode
                ? AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: Image.network(
                      spaceProvider.spaceSelected!.photoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 175,
                    right: 1,
                    child: SizedBox(
                      width: 55,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          iconSize: 20,
                          backgroundColor: MainTheme.background,
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: () {
                          // Lógica para editar
                        },
                        icon: Icon(
                          Icons.edit,
                          color: MainTheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
                : Image.network(
              spaceProvider.spaceSelected!.photoUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceInfoDetails(
                    localName: spaceProvider.spaceSelected!.localName,
                    capacity: spaceProvider.spaceSelected!.capacity,
                    username: profileProvider.usernameExpect,
                    description: spaceProvider.spaceSelected!.descriptionMessage,
                    streetAddress: spaceProvider.spaceSelected!.streetAddress,
                    cityPlace: spaceProvider.spaceSelected!.cityPlace,
                    isEditMode: spaceProvider.isEditMode,
                  ),
                  const SizedBox(height: 15),
                  // Campo para precio
                  spaceProvider.isEditMode
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _nightPriceController,
                          cursorColor: MainTheme.primary,
                          decoration: InputDecoration(
                            hintText: "Nuevo precio por noche",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MainTheme.primary)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MainTheme.primary)),
                          ),
                          style: TextStyle(color: MainTheme.contrast),
                        ),
                      ),
                      IconButton(
                        onPressed: _updateNightPrice,
                        icon: Icon(
                          Icons.edit,
                          color: MainTheme.secondary,
                        ),
                      ),
                    ],
                  )
                      : Text(
                    "Precio por noche: S/.${spaceProvider.spaceSelected!.nightPrice}",
                    style: TextStyle(color: MainTheme.contrast),
                  ),
                  const SizedBox(height: 15),
                  spaceProvider.isEditMode
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _featuresController,
                          cursorColor: MainTheme.primary,
                          decoration: InputDecoration(
                            hintText: "Servicios adicionales",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MainTheme.primary)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MainTheme.primary)),
                          ),
                          style: TextStyle(color: MainTheme.contrast),
                        ),
                      ),
                      IconButton(
                        onPressed: _updateFeatures,
                        icon: Icon(
                          Icons.edit,
                          color: MainTheme.secondary,
                        ),
                      ),
                    ],
                  )
                      : Text(
                    "Servicios adicionales: ${spaceProvider.spaceSelected!.features}",
                    style: TextStyle(color: MainTheme.contrast),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const MySpaceDetailsActions(),
          ],
        ),
      )
          : Center(
        child: CircularProgressIndicator(
          color: MainTheme.secondary,
        ),
      ),
    );
  }
}

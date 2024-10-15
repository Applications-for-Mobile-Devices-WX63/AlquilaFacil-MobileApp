import 'dart:ui';

import 'package:alquilafacil/profile/presentation/providers/pofile_provider.dart';
import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../public/ui/theme/main_theme.dart';

class SpaceInfo extends StatefulWidget {
  const SpaceInfo({super.key});
  @override
  State<StatefulWidget> createState() => _SpaceInfoState();
}

class _SpaceInfoState  extends State<SpaceInfo> {

  @override
  void initState() {
    super.initState();
    final profileProvider = context.read<ProfileProvider>();
    final spaceProvider = context.read<SpaceProvider>();
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
          backgroundColor: MainTheme.background,
          title: const Text("Información del espacio"),
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
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      spaceProvider.spaceSelected!.localName,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: MainTheme.contrast,
                          fontSize: 25.0
                      ),
                    ),
                    Text(
                      "${spaceProvider.spaceSelected!
                          .streetAddress} ${spaceProvider.spaceSelected!
                          .cityPlace}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: MainTheme.contrast,
                          fontSize: 20.0
                      ),
                    ),
                    Text(
                      "Aforo: ${spaceProvider.spaceSelected!
                          .capacity} personas",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: MainTheme.helper,
                          fontSize: 15.0
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Propietario: ${profileProvider.usernameExpect}",
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
                      spaceProvider.spaceSelected!.descriptionMessage,
                      style: TextStyle(
                          color: MainTheme.contrast,
                          fontSize: 20.0
                      ),
                    )

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

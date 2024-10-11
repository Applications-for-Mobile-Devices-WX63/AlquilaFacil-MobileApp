import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:alquilafacil/spaces/presentation/widgets/search_space_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/space_provider.dart';

class FilterSpaces extends StatelessWidget {
  const FilterSpaces({super.key});

  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainTheme.background,
        title: const Center(
          child: Text(
            "Realizar búsqueda",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
        ),
      ),
      backgroundColor: MainTheme.background,
      bottomNavigationBar: const ScreenBottomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const SearchSpaceButton(
                suffixIcon: Icons.close,
              ),
              const SizedBox(height: 50),
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: MainTheme.background,
                    elevation: 2.0,
                    child: ListTile(
                      title: Text(
                          spaceProvider.currentSpaces[index].localName,
                        textAlign: TextAlign.end,
                      ),
                      leading:Image.network( spaceProvider.currentSpaces[index].photoUrl),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              spaceProvider.currentSpaces[index].nightPrice.toString(),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                              spaceProvider.currentSpaces[index].cityPlace,
                            textAlign: TextAlign.end,
                          )
                        ],
                      )
                    ),
                  );
                },
                itemCount: spaceProvider.currentSpaces.length,
                shrinkWrap: true,

              )
            ],
          ),
        ),
      ),
    );
  }
}

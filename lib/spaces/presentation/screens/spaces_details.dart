import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:alquilafacil/spaces/presentation/widgets/search_space_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/space_provider.dart';

class SpacesDetails extends StatefulWidget {
  const SpacesDetails({super.key});
  @override
  State<StatefulWidget> createState() => _SpaceDetailsState();
}

class _SpaceDetailsState extends State<SpacesDetails> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final spaceProvider = context.read<SpaceProvider>();
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (args != null) {
        final district = args['district'];
        if (district != null) {
          spaceProvider.searchSpaceByName(district);
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainTheme.background,
        title: const Center(
          child: Text(
            "Espacios Encontrados",
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
              const SizedBox(height: 50),
              spaceProvider.currentSpaces.isNotEmpty
                  ? ListView.builder(
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

              ) : const Text("No existen locales con estos parámetros")
            ],
          ),
        ),
      ),
    );
  }

}

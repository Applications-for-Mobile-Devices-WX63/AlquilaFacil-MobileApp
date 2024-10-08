import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:alquilafacil/spaces/presentation/widgets/card.dart';
import 'package:alquilafacil/spaces/presentation/widgets/search_space_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchSpaces extends StatefulWidget {
  const SearchSpaces({super.key});
  @override
  State<StatefulWidget> createState() => _SearchSpaces();
}

class _SearchSpaces extends State<SearchSpaces> {
  @override
  void initState(){
    super.initState();
    final spaceProvider = context.read<SpaceProvider>();
    () async {
       await spaceProvider.getAllSpaces();
    }();

  }
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    return Scaffold(
      bottomNavigationBar: const ScreenBottomAppBar(),
      backgroundColor: MainTheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SearchSpaceButton(routeToRedirect: 'filter-spaces'),
                    Container(
                      decoration: BoxDecoration(
                          color: MainTheme.helper,
                          borderRadius: BorderRadius.circular(25.0)),
                      child: IconButton(
                          onPressed: () =>
                              {Navigator.pushNamed(context, "/filter-screen")},
                          icon: const Icon(
                            Icons.filter_alt,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                   return  SpaceCard(
                      location: spaceProvider.spaces[index].cityPlace,
                      price: spaceProvider.spaces[index].nightPrice.toString(),
                      imageUrl: spaceProvider.spaces[index].photoUrl,
                    );
                  },
                  itemCount: spaceProvider.spaces.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:alquilafacil/spaces/presentation/widgets/card.dart';
import 'package:alquilafacil/spaces/presentation/widgets/search_space_button.dart';
import 'package:flutter/material.dart';

class SearchSpaces extends StatefulWidget {
  const SearchSpaces({super.key});
  @override
  State<StatefulWidget> createState() => _SearchSpaces();
}

class _SearchSpaces extends State<SearchSpaces> {
  @override
  Widget build(BuildContext context) {
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
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SpaceCard(
                      location: 'San Miguel, Perú',
                      price: '1,555',
                      imageUrl:
                          'https://images.adsttc.com/media/images/5d34/e507/284d/d109/5600/0240/newsletter/_FI.jpg?1563747560',
                    ),
                    SpaceCard(
                      location: 'Miraflores, Lima',
                      price: '2,000',
                      imageUrl:
                          'https://images.adsttc.com/media/images/5d34/e507/284d/d109/5600/0240/newsletter/_FI.jpg?1563747560',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

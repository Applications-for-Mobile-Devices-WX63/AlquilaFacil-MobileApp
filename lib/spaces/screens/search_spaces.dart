
import 'package:alquilafacil/public/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/spaces/widgets/search_space_button.dart';
import 'package:flutter/material.dart';

import '../../public/ui/theme/main_theme.dart';

class SearchSpaces extends StatefulWidget{
  const SearchSpaces({super.key});
  @override
  State<StatefulWidget> createState() => _SearchSpaces();
}

class _SearchSpaces extends State<SearchSpaces> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: const BottomAppBar(
        child:  ScreenBottomAppBar(),
      ),
      backgroundColor:  MainTheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0,right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SearchSpaceButton(routeToRedirect: 'filter-spaces'),
                    Container(
                      decoration: BoxDecoration(
                        color: MainTheme.helper,
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                      child: IconButton(onPressed: ()=>{Navigator.pushNamed(context, "/filter-screen")},
                          icon: const Icon(
                              Icons.filter_alt,
                          )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
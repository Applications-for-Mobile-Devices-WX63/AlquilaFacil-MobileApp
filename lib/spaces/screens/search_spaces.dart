
import 'package:alquilafacil/public/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/theme/main_theme.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0,right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: MainTheme.helper,
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top:5.0),
                        child: TextField(
                          textAlign: TextAlign.start,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15.0
                          ),
                          decoration: InputDecoration(
                           enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(
                               color: MainTheme.transparent
                             )
                           ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: MainTheme.transparent
                              )
                            ),
                            hintText: "Busca tu espacio ideal",
                            prefixIcon: IconButton(onPressed: ()=>{}, icon: const Icon(Icons.search_outlined)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: MainTheme.helper,
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                      child: IconButton(onPressed: ()=>{}, 
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
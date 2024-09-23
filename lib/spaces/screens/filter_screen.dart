import 'dart:ui';

import 'package:alquilafacil/public/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../public/ui/theme/main_theme.dart';


class FilterScreen extends StatelessWidget{
  const FilterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.background,
      appBar: AppBar(
        backgroundColor:  MainTheme.background,
        title: const Center(
          child: Text(
              "Filtros",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            )
          )
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: ScreenBottomAppBar(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 10.0),
              child: Text(
                  "Tipo de espacio",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            Column(
              children: [
                SizedBox(height: 50),
                Row(
                  children: [
                    SizedBox(width: 10),
                    SpaceTypeCard(spaceImageType: "https://tse4.mm.bing.net/th?id=OIP.N62R-B5j13QHIL9OhcdJ1wHaHa&pid=Api&P=0&h=180", spaceTypeTitle: "Casa de playa"),
                    SizedBox(width: 20),
                    SpaceTypeCard(spaceImageType: "https://tse1.mm.bing.net/th?id=OIP.LnALBZ2Bu7Mnw46vjKeMYAHaHa&pid=Api&P=0&h=180", spaceTypeTitle: "Casa urbana"),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    SizedBox(width: 10),
                    SpaceTypeCard(spaceImageType: "https://cdn3.iconfinder.com/data/icons/beauty-cosmetics-1-line/128/beauty-salon_beauty_salon_barbershop_glamour-512.png", spaceTypeTitle: "Salones elegantes"),
                    SizedBox(width: 20),
                    SpaceTypeCard(spaceImageType: "https://cdn-icons-png.flaticon.com/512/74/74951.png", spaceTypeTitle: "Casa de campo"),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top:30,left: 10),
              child: Text(
                "Capacidad de Personas",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
           SizedBox(height: 20),
            Column(
              children: [
                SizedBox(height: 20),
                PersonCapacityFilter(filterRange: "5-10"),
                SizedBox(height: 20),
                PersonCapacityFilter(filterRange: "10-25"),
                SizedBox(height: 20),
                PersonCapacityFilter(filterRange: "25-50"),
                SizedBox(height: 20),
                PersonCapacityFilter(filterRange: "50-100")
              ],
            )
          ],
        ),
      )
    );
  }

}

class SpaceTypeCard extends StatelessWidget {
  final String spaceImageType;
  final String spaceTypeTitle;
  const SpaceTypeCard({super.key, required this.spaceImageType, required this.spaceTypeTitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 170,
              height: 190,
              child: Card(
                color:  MainTheme.background,
                elevation: 10.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                        spaceImageType,
                        width: 50.0,
                      ),
                    Text(
                      spaceTypeTitle,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PersonCapacityFilter extends StatefulWidget{
  final String filterRange;
  const PersonCapacityFilter({super.key, required this.filterRange});
  @override
  State<StatefulWidget> createState()=> _PersonCapacityFilter();

}

class _PersonCapacityFilter extends State<PersonCapacityFilter>{
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Checkbox(
          side: const BorderSide(
         color: Colors.black
        ),
            shape: const CircleBorder(),
            value: isChecked,
          checkColor: Colors.transparent,
          activeColor: Colors.black,
          onChanged: (bool? newValue) {
            setState(() {
              isChecked = newValue ?? false;
            });
          },
        ),
        const SizedBox(width: 10),
        Text(
            widget.filterRange,
          style: const TextStyle(
            color: Colors.black
          ),
        )
      ],
    );
  }

}

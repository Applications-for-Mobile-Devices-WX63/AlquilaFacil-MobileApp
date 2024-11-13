import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../public/ui/theme/main_theme.dart';

class PlanTypeInformation extends StatelessWidget {
  final String planName;
  final int planPrice;
  final String planService;
  final int planId;
  const PlanTypeInformation({super.key, required this.planName, required this.planPrice, required this.planService, required this.planId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: MainTheme.background(context),
        elevation: 5.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap:  (){

          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(
                      "https://tse4.mm.bing.net/th?id=OIP.N62R-B5j13QHIL9OhcdJ1wHaHa&pid=Api&P=0&h=180",
                    width: 50,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                          planName,
                        style: TextStyle(
                          color: MainTheme.contrast(context),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                            planService,
                          style: TextStyle(
                            fontSize: 10.0,
                            color: MainTheme.helper(context)
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

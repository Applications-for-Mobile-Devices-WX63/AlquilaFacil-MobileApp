import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanSelectedDetails extends StatelessWidget {
  final String planName;
  final String planService;
  final int id;
  final int planPrice;
  const PlanSelectedDetails({super.key, required this.planName, required this.planService, required this.id, required this.planPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: SizedBox(
        width: 500,
        height: 600,
        child: Card(
          elevation: 15.0,
          color: MainTheme.background(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  "https://tse4.mm.bing.net/th?id=OIP.N62R-B5j13QHIL9OhcdJ1wHaHa&pid=Api&P=0&h=180",
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                      child: Text(
                        "$planName :",
                        style: TextStyle(
                            color: MainTheme.contrast(context),
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                      child: Text(
                        planService,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: MainTheme.helper(context)
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                      child: Text(
                        "Precio total: \$$planPrice",
                        style: TextStyle(
                            color: MainTheme.contrast(context),
                            fontWeight: FontWeight.bold,
                          fontSize: 15.0
                        ),
                      ),
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

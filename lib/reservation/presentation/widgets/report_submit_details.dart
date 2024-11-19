import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../public/ui/theme/main_theme.dart';

class ReportSubmitDetails extends StatelessWidget {
  final String ownerName;
  final String localName;
  final TextEditingController descriptionReportController;
  const ReportSubmitDetails({super.key, required this.ownerName, required this.localName, required this.descriptionReportController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 700,
      child: Card(
        elevation: 20.0,
        color: MainTheme.background(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: const Text(
                "Enviar un mensaje:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      "Nombre del propietario",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(ownerName),
                  const SizedBox(height: 10),
                  const Text(
                      "Local:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text(localName),
                  const SizedBox(height: 10),
                  const Text(
                      "Asunto:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                  ),
                  const SizedBox(height: 10),
                 SizedBox(
                   height: 40,
                   child: TextField(
                     cursorColor: MainTheme.contrast(context),
                     style: const TextStyle(
                       fontSize: 10
                     ),
                     decoration: InputDecoration(
                       focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(15)
                       ),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15)
                       ),
                     )
                   ),
                 ),
                  const SizedBox(height: 10),
                  const Text(
                      "Razon:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                  ),

                  TextField(
                    controller: descriptionReportController,
                    minLines: 1,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    cursorColor: MainTheme.contrast(context),
                    style: const TextStyle(
                        fontSize: 10
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onChanged: (value) {

                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 220),
            Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MainTheme.secondary(context),
                      foregroundColor: MainTheme.background(context),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: (){

                    },
                    child: const Text("Enviar mensaje")
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
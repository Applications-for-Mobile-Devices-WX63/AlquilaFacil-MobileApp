import 'package:alquilafacil/public/presentation/widgets/custom_dialog.dart';
import 'package:alquilafacil/spaces/domain/model/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../../public/ui/theme/main_theme.dart';
import '../providers/report_provider.dart';

class ReportSubmitDetails extends StatelessWidget {
  final String ownerName;
  final String localName;
  final int localId;
  final int userId;
  final TextEditingController descriptionReportController;
  final TextEditingController titleReportController;
  const ReportSubmitDetails({super.key, required this.ownerName, required this.localName, required this.descriptionReportController, required this.titleReportController, required this.localId, required this.userId});

  @override
  Widget build(BuildContext context) {
    final reportProvider = context.watch<ReportProvider>();
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
                "Reportar un espacio:",
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
                      "Motivo:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                  ),
                  const SizedBox(height: 10),
                 SizedBox(
                   height: 40,
                   child: TextField(
                     controller: titleReportController,
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
                      "Descripción:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                  ),
                  TextField(
                    controller: descriptionReportController,
                    minLines: 8,
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
            const SizedBox(height: 100),
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
                    onPressed: () async{
                      var reportToAdd = Report(id: 0, localId: localId, title: titleReportController.text, userId: userId, description: descriptionReportController.text);
                      try{
                            await reportProvider.createReport(reportToAdd);
                            showDialog(context: context, builder: (_) => CustomDialog(title: "Reporte al espacio $localName creado éxitosamente", route: "/search-space"));
                      } catch (e){
                        Logger().e("Error while trying to create a report $e  ${reportToAdd.toJson()}");
                      }

                    },
                    child: const Text("Reportar")
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

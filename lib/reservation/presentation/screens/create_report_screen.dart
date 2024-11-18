import 'package:alquilafacil/auth/presentation/screens/login.dart';
import 'package:alquilafacil/profile/presentation/providers/pofile_provider.dart';
import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/reservation/presentation/widgets/report_submit_details.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../public/ui/theme/main_theme.dart';

class CreateReportScreen extends StatelessWidget {
  const CreateReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    final profileProvider = context.watch<ProfileProvider>();
    final TextEditingController descriptionReportController = TextEditingController();
    return Scaffold(
      backgroundColor: MainTheme.primary(context),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: MainTheme.secondary(context),
                          foregroundColor: MainTheme.background(context)
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                            Icons.arrow_back_ios,
                          size: 15,
                        )
                    ),
                    const SizedBox(width: 20),
                    Text(
                        "Reporte",
                      style: TextStyle(
                        color: MainTheme.background(context),
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
             ReportSubmitDetails(
               ownerName: profileProvider.usernameExpect,
               localName: spaceProvider.spaceSelected!.localName,
               descriptionReportController: descriptionReportController,
             ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}

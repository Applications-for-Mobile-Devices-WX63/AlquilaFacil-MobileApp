import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:alquilafacil/spaces/presentation/widgets/step_card.dart';
import 'package:flutter/material.dart';

class RegisterSpaceStep1 extends StatelessWidget {
  final PageController pageController;
  const RegisterSpaceStep1({super.key, required this.pageController});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Empezar a usar AlquilaFácil es muy sencillo.',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Completa los siguientes pasos para registrar tu espacio en la aplicación',
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            const SizedBox(height: 25.0),

            StepCard(
              image: Image.network(
                  "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTL1WWbWCvhxqAxHN_beVZxjCdwsolm-ECyDixvSz6WLtMIVVEK"),
              stepNumber: '1. Describe tu espacio',
              description: 'Comparte algunos datos básicos',
            ),

            StepCard(
              image: Image.network(
                  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTlnTHj2JDAP68rhPxI6bgEZ7wsx1Ys_uHoQ9WpCHtwqEcPnb6N"),
              stepNumber: '2. Haz que destaque',
              description:
              'Agrega algunas fotos y un título a tu espacio, nosotros nos encargamos del resto',
            ),

            // Step 3 - Card
            StepCard(
              image: Image.network(
                  "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT0zf6Z5H2uLQJ7XdgVNQ9GutUVWE9lRfld0HV2qyX2TnfohZMb"),
              stepNumber: '3. Terminar y publicar',
              description:
              'Agrega las últimas configuraciones y publica tu espacio',
            ),

            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MainTheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Comencemos'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
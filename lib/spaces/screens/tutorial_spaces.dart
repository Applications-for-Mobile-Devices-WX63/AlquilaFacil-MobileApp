import 'package:flutter/material.dart';

class TutorialSpaces extends StatefulWidget{
  const TutorialSpaces({super.key});
  @override
  State<StatefulWidget> createState() => _TutorialSpaces();
}
class _TutorialSpaces extends State<TutorialSpaces>{
  @override

  Widget build( BuildContext context){
    return Scaffold(
  backgroundColor: Colors.white, // Aplicar color de fondo al Scaffold directamente

    appBar: AppBar(
  title: const Text('Registrar un espacio'),
  backgroundColor: Colors.white,),
    body: SingleChildScrollView(

       padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Empezar a usar AlquilaFácil es muy sencillo.',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Text(
            'Completa los siguientes pasos para registrar tu espacio en la aplicación',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          
          _buildStepCard(
                  icon: Icons.home,
                  stepNumber: '1. Describe tu espacio',
                  description: 'Comparte algunos datos básicos',
                ),
                 _buildStepCard(
                  icon: Icons.light,
                  stepNumber: '2. Haz que destaque',
                  description: 'Agrega algunas fotos y un título a tu espacio, nosotros nos encargamos del resto',
                ),
                  _buildStepCard(
                  icon: Icons.light,
                  stepNumber: '3. Terminar y publicar',
                  description: 'Agrega las últimas configuraciones y publica tu espacio',
                ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/tutorial-space');
                        },
                        style: ElevatedButton.styleFrom(
                          
                            backgroundColor: Colors.red[800],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 40.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0
                            ),
                            
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
                ),

        ],
        
      ),
       
        ),

    );

  }
Widget _buildStepCard({
    required IconData icon,
    required String stepNumber,
    required String description,
  }) {
    return Container(
      
      margin: const EdgeInsets.only(top:25.0),

      child: Padding(
        
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 50.0),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stepNumber,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}


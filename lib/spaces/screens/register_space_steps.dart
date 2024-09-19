import 'package:flutter/material.dart';

class RegisterSpaceSteps extends StatefulWidget {
  const RegisterSpaceSteps({Key? key}) : super(key: key);

  @override
  _RegisterSpaceStepsState createState() => _RegisterSpaceStepsState();
}

class _RegisterSpaceStepsState extends State<RegisterSpaceSteps> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Registrar Espacio'),
        backgroundColor: Colors.white,

      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          _buildStep1(), 
          _buildStep2(),
          _buildStep3(),
          _buildStep4(),
          _buildStep5(),

        ],
      ),
    );
  }


  Widget _buildStep1() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Empezar a usar AlquilaFácil es muy sencillo.',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Completa los siguientes pasos para registrar tu espacio en la aplicación',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 25.0),
            
            // Step 1 - Card
            _buildStepCard(
              icon: Icons.home,
              stepNumber: '1. Describe tu espacio',
              description: 'Comparte algunos datos básicos',
            ),
            
            // Step 2 - Card
            _buildStepCard(
              icon: Icons.light,
              stepNumber: '2. Haz que destaque',
              description: 'Agrega algunas fotos y un título a tu espacio, nosotros nos encargamos del resto',
            ),
            
            // Step 3 - Card
            _buildStepCard(
              icon: Icons.light,
              stepNumber: '3. Terminar y publicar',
              description: 'Agrega las últimas configuraciones y publica tu espacio',
            ),

            const SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[800],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
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

  Widget _buildStep2() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Paso 1: Describe tu espacio', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
          SizedBox(height: 16),
          Text('En este paso, te preguntaremos qué tipo de propiedad tienes.A continuación, indícanos la ubicación y algunas cosas más.', style: TextStyle(color: Colors.grey,  fontWeight: FontWeight.bold, fontSize: 16),),
          Expanded(child: Container()), 
          _buildNavigationButtons()
        ],
      ),
    );
  }

 Widget _buildStep3() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '¿Cuál de estas opciones describe mejor tu espacio?',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 16),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2, // Número de columnas
            children: [
              _buildOptionCard(
                icon: Icons.beach_access, 
                title: 'Casa de playa'
              ),
              _buildOptionCard(
                icon: Icons.location_city, 
                title: 'Casa urbana'
              ),
              _buildOptionCard(
                icon: Icons.weekend, 
                title: 'Salones elegantes'
              ),
              _buildOptionCard(
                icon: Icons.park, 
                title: 'Casa de campo'
              ),
            ],
          ),
        ),
        _buildNavigationButtons(), // Botones de navegación
      ],
    ),
  );
}


Widget _buildStep4() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView( // Envolver toda la pantalla en el scroll
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Confirma tu dirección',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8.0),
          Text(
            'Solo compartiremos tu dirección con los que hayan hecho una reservación',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(height: 16.0),

          // Formulario de dirección
          Column(
            children: [
              _buildTextField('Región', 'Perú'),
              SizedBox(height: 16.0),
              _buildTextField('Dirección', 'Perú'),
              SizedBox(height: 16.0),
              _buildTextField('Apartamento, edificio, piso, condominio', 'Perú'),
              SizedBox(height: 16.0),
              _buildTextField('Ciudad', 'Perú'),
              SizedBox(height: 16.0),
              _buildTextField('Distrito / provincia', 'Perú'),
            ],
          ),

          SizedBox(height: 32.0), // Espacio antes de los botones

          // Botones de navegación
          _buildNavigationButtons(isLastStep: true),
        ],
      ),
    ),
  );
}

  Widget _buildStep5() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Paso 1: Describe tu espacio', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black)),
          SizedBox(height: 16),
          Text('En este paso, te preguntaremos qué tipo de propiedad tienes.A continuación, indícanos la ubicación y algunas cosas más.', style: TextStyle(color: Colors.grey,  fontWeight: FontWeight.bold, fontSize: 16),),
          Expanded(child: Container()), 
          _buildNavigationButtons()
        ],
      ),
    );
  }


































Widget _buildTextField(String label, String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0), // Espaciado vertical
    child: TextFormField(
      cursorColor: Colors.red[900], // Cambia el color del cursor a rojo
      style: TextStyle(color: Colors.black), // Color del texto
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black, // Color de la etiqueta
          fontSize: 16.0, // Tamaño de la etiqueta
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey, // Color del texto de sugerencia
          fontSize: 14.0, // Tamaño del texto de sugerencia
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
          borderSide: BorderSide(
            color: Colors.black, // Color del borde
            width: 1.0, // Grosor del borde
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.black, // Color del borde cuando está enfocado
            width: 1.0, // Grosor del borde cuando está enfocado
          ),
        ),
      ),
    ),
  );
}


Widget _buildNavigationButtons({bool isLastStep = false}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Botón "Anterior"
        OutlinedButton(
          onPressed: _currentPage > 0
              ? () {
                  _pageController.previousPage(
                      duration: Duration(milliseconds: 300), curve: Curves.ease);
                }
              : null,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Colors.red[900]!, // Borde rojo oscuro
              width: 2.0, // Ancho del borde, ajusta el valor para hacerlo más grueso
            ),
            foregroundColor: Colors.black, // Texto negro
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Tamaño del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
            ),
          ),
          child: const Text('Anterior', style: TextStyle(fontSize: 16.0)),
        ),

        ElevatedButton(
          onPressed: isLastStep
              ? () {
                  Navigator.pushNamed(context, '/success-page');
                }
              : () {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 300), curve: Curves.ease);
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[900], // Fondo rojo
            foregroundColor: Colors.white, // Texto blanco
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Tamaño del botón
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
            ),
          ),
          child: Text(isLastStep ? 'Finalizar' : 'Siguiente', style: TextStyle(fontSize: 16.0)),
        ),
      ],
    ),
  );
}

  Widget _buildStepCard({
    required IconData icon,
    required String stepNumber,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 25.0),
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
}// Tarjeta para cada opción
Widget _buildOptionCard({required IconData icon, required String title}) {
  return GestureDetector(
    onTap: () {
      // Lógica cuando se selecciona la opción
    },
    child: FractionallySizedBox(
      widthFactor: 0.8, // Controla el ancho relativo al espacio disponible
      heightFactor: 0.8 ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Sombras alrededor
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.black),
            SizedBox(height: 12.0),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

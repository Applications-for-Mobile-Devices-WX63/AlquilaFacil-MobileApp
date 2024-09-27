import 'package:alquilafacil/public/widgets/screen_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class RegisterSpaceSteps extends StatefulWidget {
  const RegisterSpaceSteps({super.key});

  @override
  _RegisterSpaceStepsState createState() => _RegisterSpaceStepsState();
}

class _RegisterSpaceStepsState extends State<RegisterSpaceSteps> {
  final PageController _pageController = PageController();
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
        title: const Text('Registrar Espacio'),
        backgroundColor: Colors.white,

      ),
      bottomNavigationBar: const BottomAppBar(
        child: ScreenBottomAppBar(),
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
          _buildStep6(),
          _buildStep7(),
          _buildStep8(),
          _buildStep9(),



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
              image: Image.network("https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTL1WWbWCvhxqAxHN_beVZxjCdwsolm-ECyDixvSz6WLtMIVVEK"),
              stepNumber: '1. Describe tu espacio',
              description: 'Comparte algunos datos básicos',
            ),

            // Step 2 - Card
            _buildStepCard(
              image: Image.network("https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTlnTHj2JDAP68rhPxI6bgEZ7wsx1Ys_uHoQ9WpCHtwqEcPnb6N"),
              stepNumber: '2. Haz que destaque',
              description: 'Agrega algunas fotos y un título a tu espacio, nosotros nos encargamos del resto',
            ),
            
            // Step 3 - Card
            _buildStepCard(
              image: Image.network("https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT0zf6Z5H2uLQJ7XdgVNQ9GutUVWE9lRfld0HV2qyX2TnfohZMb"),
              stepNumber: '3. Terminar y publicar',
              description: 'Agrega las últimas configuraciones y publica tu espacio',
            ),

            const SizedBox(height: 25.0),
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
        const Text(
          'Paso 1: Describe tu espacio',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 16),
        const Text(
          'En este paso, te preguntaremos qué tipo de propiedad tienes. A continuación, indícanos la ubicación y algunas cosas más.',
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 16), // Espaciado adicional si es necesario
        Center(
          child: Image.network(
            "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQLgRgP9eEF3IC5gSDDHPh5OQCuwoc_0ykCa1r35rw3ibQ5qenx",
            height: 230, 
            width: 300,
          ),
        ),
        const SizedBox(height: 16), 
        _buildNavigationButtons(),
      ],
    ),
  );
}


Widget _buildStep3() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '¿Cuál de estas opciones describe mejor tu espacio?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true, 
            physics: const NeverScrollableScrollPhysics(), 
            children: [
              _buildOptionCard(
                icon: Icons.beach_access,
                title: 'Casa de playa',
              ),
              _buildOptionCard(
                icon: Icons.location_city,
                title: 'Casa urbana',
              ),
              _buildOptionCard(
                icon: Icons.weekend,
                title: 'Salones elegantes',
              ),
              _buildOptionCard(
                icon: Icons.park,
                title: 'Casa de campo',
              ),
            ],
          ),
          const SizedBox(height: 16), 
          _buildNavigationButtons(), 
        ],
      ),
    ),
  );
}
Widget _buildStep4() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView( 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Confirma tu dirección',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Solo compartiremos tu dirección con los que hayan hecho una reservación',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 16.0),

          Column(
            children: [
              _buildTextField('Región', 'Perú'),
              const SizedBox(height: 16.0),
              _buildTextField('Dirección', 'Perú'),
              const SizedBox(height: 16.0),
              _buildTextField('Apartamento, edificio, piso, condominio', 'Perú'),
              const SizedBox(height: 16.0),
              _buildTextField('Ciudad', 'Perú'),
              const SizedBox(height: 16.0),
              _buildTextField('Distrito / provincia', 'Perú'),
            ],
          ),

          const SizedBox(height: 32.0),        
          _buildNavigationButtons(isLastStep: false),
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
        const Text(
          'Paso 2: Haz que tu espacio destaque',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 16),
        const Text(
          'En este paso, deberás agregar algunas fotos de tu espacio. Luego, deberás crear un título y una descripción.',
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 16), 
        Center(
          child: Image.network(
            "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSi8iXnDsVRUStoDzFe1_nfw5Zciu45XoFRvvRM0R8hPKG2DBbj",
            height: 230, 
            width: 300,
          ),
        ),
        const SizedBox(height: 16), 
        _buildNavigationButtons(),
      ],
    ),
  );
}

Widget _buildStep6() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Agrega algunas fotos de tu espacio',
            style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold, 
              color: Colors.black
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Para empezar, necesitarás cuatro fotos.\nDespués podrás agregar más o hacer cambios.',
            style: TextStyle(
              color: Colors.grey, 
              fontWeight: FontWeight.bold, 
              fontSize: 16
            ),
          ),
          const SizedBox(height: 32),
          // Botón para añadir img
          GestureDetector(
            onTap: () {
              // Acción al hacer clic en el botón
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2, 
                    blurRadius: 5, 
                    offset: const Offset(0, 3), 
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_upload_outlined, color: Colors.red, size: 40),
                  SizedBox(width: 10),
                  Text(
                    'Usa el botón para añadir una imagen',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Divider(
            color: Colors.black, 
            thickness: 1,        
          ),
          const SizedBox(height: 16),
          const Text(
            'Previsualización:',
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 16, 
              color: Colors.black
            ),
          ),
          const SizedBox(height: 16),
        
          Center(
            child: Image.network(
              "https://i.ibb.co/SKckgH6/Frame-300.png",
              height: 50, // Tamaño ajustado de la imagen
            ),
          ),
          const SizedBox(height: 32),
          _buildNavigationButtons(), 
        ],
      ),
    ),
  );
}

int _selectedCapacity = 25; 

Widget _buildStep7() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Ahora, añade los detalles de tu espacio',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Los títulos cortos funcionan mejor.\nNo te preocupes, puedes modificarlo más adelante.',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 16),
          _buildTextField('Título', 'Perú'),
          const SizedBox(height: 16),
          _buildTextField('Descripción', 'Perú'),
          const SizedBox(height: 16),
          const Text(
            'Aforo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          _buildCapacitySelector(), 
          const SizedBox(height: 16),
           _buildCaracteristicas(), 
          const SizedBox(height: 16),
          _buildNavigationButtons(),
        ],
      ),
    ),
  );
}
Widget _buildCaracteristicas() {
  List<Map<String, String>> features = [
    {'name': 'Estacionamiento'},
    {'name': 'Wi-Fi'},
    {'name': 'Cámaras de seguridad'}
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Características',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              // funcionalidad
            },
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
      ListView.builder(
        shrinkWrap: true, 
        physics: const NeverScrollableScrollPhysics(), 
        itemCount: features.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Text(
              '• ${features[index]["name"]}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    // Funcionalidad
                  },
                  icon: const Icon(Icons.delete),
                ),
                IconButton(
                  onPressed: () {
                   // Funcionalidad
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}

Widget _buildStep8() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ponle un precio a tu espacio',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Podrás cambiarlo en cualquier momento',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 2), 
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                Text(
                  'S/. 100/h',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Precio (sin incluir impuestos) S/. 106/h',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Container()), 
        _buildNavigationButtons(),
      ],
    ),
  );
}Widget _buildStep9() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '¡Es todo!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Esto es lo que verán los demás.',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Container(
            width: 300, 
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                     
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Miraflores, Lima',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8), 
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWC9KhS6mLBAB3Yxro0ZinIYsZnqwrS9sAAg&s', 
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover, 
                ),
                const SizedBox(height: 4),
                const Text(
                  'Departamento',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'S/300/hora',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildNavigationButtons(isLastStep: true),
      ],
    ),
  );
}


Widget _buildTextField(String label, String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      cursorColor: Colors.red[900], 
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black, 
          fontSize: 16.0,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey, 
          fontSize: 14.0, 
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), 
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.0, 
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.black, 
            width: 1.0,
          ),
        ),
      ),
    ),
  );
}

Widget _buildCapacitySelector() {
  return Column(
    children: <Widget>[
      _buildRadioOption(5, '5-10'),
      _buildRadioOption(10, '10-25'),
      _buildRadioOption(25, '25-50'),
      _buildRadioOption(50, '50-75'),
      _buildRadioOption(75, '75+'),
    ],
  );
}

Widget _buildRadioOption(int value, String label) {
  return RadioListTile<int>(
    value: value,
    groupValue: _selectedCapacity,
    onChanged: (int? newValue) {
      if (newValue != null) {
        setState(() {
          _selectedCapacity = newValue;
        });
      }
    },
    title: Text(label),
  );
}


Widget _buildNavigationButtons({bool isLastStep = false}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: _currentPage > 0
              ? () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                }
              : null,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Colors.red[900]!,
              width: 2.0, 
            ),
            foregroundColor: Colors.black, 
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), 
            ),
          ),
          child: const Text('Anterior', style: TextStyle(fontSize: 16.0)),
        ),

        ElevatedButton(
          onPressed: isLastStep
              ? () {
                  Navigator.pushNamed(context, '/');
                }
              : () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300), curve: Curves.ease);
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[900], 
            foregroundColor: Colors.white, 
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), 
            ),
          ),
          child: Text(isLastStep ? 'Finalizar' : 'Siguiente', style: const TextStyle(fontSize: 16.0)),
        ),
      ],
    ),
  );
}

Widget _buildStepCard({
  required String stepNumber,
  required String description,
  required Image image,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 25.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80, 
            height: 80,
            child: image,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stepNumber,
                  style: const TextStyle(
                    fontSize: 20.0,
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

Widget _buildOptionCard({required IconData icon, required String title}) {
  return GestureDetector(
    onTap: () {
    },
    child: FractionallySizedBox(
      widthFactor: 0.8, 
      heightFactor: 0.8 ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), 
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.black),
            const SizedBox(height: 12.0),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tablaestudian.dart';

class pantallaPrincipalAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secciones',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  void _toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = !isDarkMode;
      prefs.setBool('isDarkMode', isDarkMode);
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Administrador'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.black : Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://estaticosgn-cdn.deia.eus/clip/f88cfdcf-3007-4c1f-8115-1f4393f896d3_16-9-aspect-ratio_default_0.jpg'),
                      radius: 30,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Nombre de Usuario',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Cerrar sesión'),
                onTap: () {
                  // Agregar lógica para cerrar sesión aquí
                },
              ),
              ListTile(
                leading: Icon(Icons.brightness_4),
                title: Text('Tema'),
                onTap: () {
                  _toggleTheme();
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Agregar lógica para justificación de asistencia tardía aquí
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistroApp()),
                );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: isDarkMode
                      ? Color.fromARGB(255, 5, 99, 71)
                      : Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                ),
                                child: Ink(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/opa.png'), // Ruta de la primera imagen
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: 300, // Ancho del botón
                    height: 150, // Alto del botón
                    child: Center(
                      child: Text(
                        'Estudiantes Asistidos',
                        style: TextStyle(
                          height: -3,
                          fontSize: 20,
                          color: isDarkMode ? Colors.black : Colors.white,
                          // Color del texto en modo oscuro
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  // Agregar lógica para justificación de asistencia tardía aquí
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: isDarkMode
                      ? Color.fromARGB(255, 5, 99, 71)
                      : Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/opa.png'), // Ruta de la segunda imagen
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: 300,
                    height: 150,
                    child: Center(
                      child: Text(
                        'Justificacion de Asistencia',
                        style: TextStyle(
                          height: -3,
                          fontSize: 20,
                          color: isDarkMode ? Colors.black : Colors.white,
                          // Color del texto en modo oscuro
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              label: 'Retroceder',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward),
              label: 'Siguiente',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: isDarkMode ? Colors.white : Colors.black,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
        ),
      ),
    );
  }
}

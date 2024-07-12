import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pantprincipaladmin.dart'; // Asegúrate de que este archivo existe y está en la ruta correcta
import 'retroceder_pagPrincipal.dart'; // Línea 5


void main() {
  runApp(RegistroApp());
}

class RegistroApp extends StatelessWidget {
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
    _loadTheme(); // Load theme preference when the app starts
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  void _saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
      _saveTheme(isDarkMode); // Save theme preference when it changes
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pantallaPrincipalAdmin()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Seccion K'),
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
                  cerrarSesion(context);
                  // Agregar lógica para cerrar sesión aquí
                },
              ),
              ListTile(
                leading: Icon(Icons.brightness_4),
                title: Text('Tema'),
                onTap: () {
                  toggleTheme();
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón
                  },
                  child: Text('Aceptar'),
                ),
              ),
              SizedBox(height: 16),
              DataTable(
                columns: [
                  DataColumn(label: Text('NIE')),
                  DataColumn(label: Text('Nombre')),
                  DataColumn(label: Text('Género')),
                  DataColumn(label: Text('Bachillerato')),
                  DataColumn(label: Text('Fecha')),
                  DataColumn(label: Text('Hora')),
                  DataColumn(label: Text('Estado')),
                ],
                rows: [],
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
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: isDarkMode ? Colors.blue : Colors.blue, // Color azul para tema oscuro y claro
          unselectedItemColor: isDarkMode ? Colors.white : Colors.black, // Color blanco para tema oscuro y negro para claro
          onTap: _onItemTapped,
          showSelectedLabels: false, // Oculta las etiquetas seleccionadas para mantener solo el efecto de zoom
          showUnselectedLabels: false, // Oculta las etiquetas no seleccionadas para mantener solo el efecto de zoom
          selectedFontSize: 14.0, // Tamaño de fuente seleccionado
          unselectedFontSize: 12.0, // Tamaño de fuente no seleccionado
        ),
      ),
    );
  }
}

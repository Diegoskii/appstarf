import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(pantallaPrincipalAdmin());
}

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
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    _loadTheme();
    _loadUsers();
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

  void _loadUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Simulating loading users from storage or an API
    setState(() {
      users = [
        {'nie': '123456', 'nombre': 'Juan Pérez', 'genero': 'M', 'bachillerato': 'Ciencias', 'fecha': '2024-07-01', 'hora': '10:00 AM', 'estado': true},
        {'nie': '789012', 'nombre': 'Ana Gómez', 'genero': 'F', 'bachillerato': 'Humanidades', 'fecha': '2024-07-01', 'hora': '10:30 AM', 'estado': false},
      ];
    });
  }

  void _addUser() {
    setState(() {
      users.add({
        'nie': 'nuevo',
        'nombre': 'Nuevo Usuario',
        'genero': 'M',
        'bachillerato': 'Nuevo Bachillerato',
        'fecha': '2024-07-01',
        'hora': '11:00 AM',
        'estado': true
      });
    });
  }

  void _removeUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  void _updateUserState(int index, bool value) {
    setState(() {
      users[index]['estado'] = value;
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Botón sin funcionalidad
                    },
                    child: Text('Actualizar'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Agregar lógica para aceptar aquí
                    },
                    child: Text('Aceptar'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('NIE', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Genero', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Bachillerato', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Fecha', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Hora', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Estado', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(user['nie'], style: TextStyle(fontSize: 14)),
                          Text(user['nombre'], style: TextStyle(fontSize: 14)),
                          Text(user['genero'], style: TextStyle(fontSize: 14)),
                          Text(user['bachillerato'], style: TextStyle(fontSize: 14)),
                          Text(user['fecha'], style: TextStyle(fontSize: 14)),
                          Text(user['hora'], style: TextStyle(fontSize: 14)),
                          Checkbox(
                            value: user['estado'],
                            onChanged: (bool? value) {
                              _updateUserState(index, value ?? false);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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

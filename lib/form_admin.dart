// lib/main.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pantprincipaladmin.dart'; // Importa el archivo home_page.dart

void main() {
  runApp(FormAdminApp());
}

class FormAdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(0, 0, 0, 1),
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .copyWith(
                titleLarge: TextStyle(color: Colors.white, fontSize: 24),
              )
              .bodyMedium,
          titleTextStyle: Theme.of(context)
              .textTheme
              .copyWith(
                titleLarge: TextStyle(color: Colors.white, fontSize: 28),
              )
              .titleLarge,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromARGB(255, 0, 170, 255)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey.withOpacity(0.5)),
          ),
        ),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      darkTheme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Administrador',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 170, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _nombreController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _correoController,
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Iniciar sesión'),
                ),
                SizedBox(height: 10),
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    String nombre = _nombreController.text.trim();
    String correo = _correoController.text.trim();

    var url = Uri.parse('http://192.168.5.244:5000/login'); // Asegúrate de usar la URL correcta
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'nombre': nombre, 'correo': correo}),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success']) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => pantallaPrincipalAdmin()),
        );
      } else {
        setState(() {
          _errorMessage = jsonResponse['message'];
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Error en el servidor';
      });
    }
  }
}

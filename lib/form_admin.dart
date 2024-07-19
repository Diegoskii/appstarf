import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pantprincipaladmin.dart';

// ignore: use_key_in_widget_constructors
class FormAdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .copyWith(
                titleLarge: const TextStyle(color: Colors.white, fontSize: 24),
              )
              .bodyMedium,
          titleTextStyle: Theme.of(context)
              .textTheme
              .copyWith(
                titleLarge: const TextStyle(color: Colors.white, fontSize: 28),
              )
              .titleLarge,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 170, 255)),
          focusedBorder: const OutlineInputBorder(
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

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Administrador',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 170, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Iniciar sesión'),
                ),
                const SizedBox(height: 10),
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    // Validar los datos ingresados
    String nombre = _nombreController.text.trim();
    String password = _passwordController.text.trim();

    // Enviar datos al servidor Flask
    var response = await http.post(
      Uri.parse('http://127.0.0.1:5000/login/administradores'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'nombre': nombre, 'contraseña': password}),
    );

    var responseData = json.decode(response.body);

    if (responseData['success']) {
      setState(() {
        _errorMessage = ''; // Limpiar el mensaje de error
      });
      // Navegar a la pantalla de inicio
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => pantallaPrincipalAdmin()),
      );
    } else {
      setState(() {
        _errorMessage = responseData['message']; // Mostrar mensaje de error
        _nombreController.clear(); // Limpiar campo de nombre
        _passwordController.clear(); // Limpiar campo de contraseña
      });
    }
  }
}

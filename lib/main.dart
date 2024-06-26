import 'package:flutter/material.dart';
import 'form_admin.dart';
import 'form_profesor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Simula un tiempo de carga
    Future.delayed(Duration(seconds: 3), () {
      // Cuando termina el tiempo de carga, navega a la siguiente pantalla
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/loading_image.png'), // Muestra la imagen
            SizedBox(height: 20),
            Text("STARF", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), // Muestra el texto "STARF"
            SizedBox(height: 20),
            CircularProgressIndicator(), // Muestra un indicador de progreso
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar al formulario de administrador
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormAdminApp()),
                );
              },
              child: Text('Administrador'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar al formulario de profesor
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormProfesorApp()),
                );
              },
              child: Text('Profesor'),
            ),
          ],
        ),
      ),
    );
  }
}

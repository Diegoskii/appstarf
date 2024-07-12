import 'package:flutter/material.dart';
import 'main.dart'; // Importar el archivo de la pantalla de destino

void cerrarSesion(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MyApp()), // Cambia 'MyApp' si el widget principal tiene otro nombre
  );
}

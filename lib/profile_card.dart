import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                  child: Container(
                    height: 192,
                    width: double.infinity,
                    color: Color.fromARGB(255, 240, 68,
                        56), // Cambia esto al color de fondo deseado
                  ),
                ),
                Spacer(),
              ],
            ),
            Positioned(
              top: 135, // Ajusta esta posición para mover el avatar
              child: CircleAvatar(
                radius: 57,
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToI7Z-_mYYTqsMuhdb8j6YhhOflESW-POVDw&usqp=CAU'),
                ),
              ),
            ),
            Positioned(
              top: 260, // Ajusta esta posición para mover el texto
              left: 20, // Ajusta el espaciado izquierdo
              right: 20, // Ajusta el espaciado derecho
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Cameron Williamson',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Web Development',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0xFF78858F),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 219, 219),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Descripción: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Soy Cameron Williamson, un apasionado profesor de matemáticas con más de 10 años de experiencia en la enseñanza de diversas ramas de las matemáticas, incluyendo álgebra, geometría y cálculo.',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Botones flotantes de redes sociales horizontales en la parte inferior
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Icon(Icons.facebook),
                    heroTag: 'facebook',
                  ),
                  SizedBox(height: 5),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Icon(Icons.map_sharp),
                    heroTag: 'twitter',
                  ),
                  SizedBox(height: 5),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Icon(Icons.youtube_searched_for),
                    heroTag: 'youtube',
                  ),
                  SizedBox(height: 5),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    child: Icon(Icons.bookmarks),
                    heroTag: 'instagram',
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
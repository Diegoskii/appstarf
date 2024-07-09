import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Container(
              height: 192,
              width: double.infinity,
              color: Color.fromARGB(
                  255, 221, 98, 89), // Cambia esto al color de fondo deseado
            ),
          ),
          Transform.translate(
            offset: Offset(0, -57),
            child: CircleAvatar(
              radius: 57,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              child: CircleAvatar(
                radius: 55,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/100'),
              ),
            ),
          ),
          SizedBox(height: 0),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Descripción del perfil: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

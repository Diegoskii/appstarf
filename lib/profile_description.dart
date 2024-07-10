import 'package:flutter/material.dart';

class ProfileDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Experienced web developer with a strong background in developing award-winning applications for a diverse clientele. Adept at building secure and efficient web applications using the latest technologies.',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
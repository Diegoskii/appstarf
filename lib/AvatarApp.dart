import 'package:flutter/material.dart';

void main() {
  runApp(AvatarApp());
}

class AvatarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircleAvatar(
            radius: 57,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/100'),
            ),
          ),
        ),
      ),
    );
  }
}

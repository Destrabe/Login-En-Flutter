
import 'package:app/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder?',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inicio'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> Homepage()),
              );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black), // Color de boton
            foregroundColor: MaterialStateProperty.all(Colors.white), // Color del texto del boton
          ),
          child: Text('Inicio de sesión'),
        ),
      ),
    );
  }
}

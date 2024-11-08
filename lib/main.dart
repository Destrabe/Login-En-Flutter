import 'package:app/HomePage.dart';
import 'package:app/auth/login_o_register.dart';
import 'package:app/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fuse',
      debugShowCheckedModeBanner: false,
      home: LoginORegister(),
      theme: LightMode,
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

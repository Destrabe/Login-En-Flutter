import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage ({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Cener(
        children: [
          //logo

          Icon(Icons.message),
          //mensaje de bienvenida
          //campo de texto de correo 
          //campo de texto de la contraseña
          //boton de login
          //registrate ahora
        ],
      ),
    );
  }
}
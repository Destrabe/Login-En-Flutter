import 'package:app/componentes/textField.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage ({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  
           //logo
          Icon(Icons.message,
          size: 60,
          color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(height: 50),

          //mensaje de bienvenida
          Text(
            "¡Bienvenido de nuevo, te hemos extrañado!",
            style: TextStyle(
              color:Theme.of(context).colorScheme.primary,
              fontSize: 16,
              ),
            ),
            
            const SizedBox(height: 25),

          //campo de texto de correo 
          CustomTextField(
            hintText: "Email",
          ),

          const SizedBox(height: 25),
          
          //campo de texto de la contraseña
          CustomTextField(
            hintText: "Contraseña",
          ),
          //boton de login
          //registrate ahora
          ],
        ),
      ),
    );
  }
}
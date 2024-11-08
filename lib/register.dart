import 'package:app/componentes/button.dart';
import 'package:app/componentes/textField.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register ({super.key, required this.onTap});
  
  // Controladores para correo y contraseña
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();
  final TextEditingController _confirmacionController = TextEditingController();

  //ir a la pagina de login
  final void Function()? onTap;

  // Método de registro
  void register() {}

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            // Mensaje de bienvenida
            Text(
              "Vamos a crear una cuenta para usted",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // Campo de texto de correo
            CustomTextField(
              hintText: "Email",
              obscureText: false,
              controller: _correoController,
            ),

            const SizedBox(height: 10),

            // Campo de texto de la contraseña
            CustomTextField(
              hintText: "Contraseña",
              obscureText: true,
              controller: _contraseniaController,
            ),

            const SizedBox(height: 10),

            // Campo de texto de la contraseña
            CustomTextField(
              hintText: "Confirma tu Contaseña",
              obscureText: true,
              controller: _confirmacionController,
            ),

            const SizedBox(height: 25),

            // Botón de login
            MyButton(
              text: "Register",
              onTap: register,
            ),

            const SizedBox(height: 25),

            // "Regístrate ahora" con estilo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿Ya tienes una cuenta? ",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Inicia sesion ahora",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
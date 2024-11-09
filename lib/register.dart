import 'package:app/componentes/button.dart';
import 'package:app/componentes/textField.dart';
import 'package:app/login.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({super.key, required this.onTap});

  // Controladores para correo y contraseña
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();

  //ir a la pagina de login
  final void Function()? onTap;

  // Método de registro
  void register(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(onTap: () {})),
    );
  }

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

            // Campo de texto del nombre
            CustomTextField(
              hintText: "Nombre",
              obscureText: false,
              controller: _nombreController,
            ),

            const SizedBox(height: 10),

            // Campo de texto del email
            CustomTextField(
              hintText: "Email",
              obscureText: true,
              controller: _correoController,
            ),

            const SizedBox(height: 10),

            // Campo de texto de la contraseña
            CustomTextField(
              hintText: "Contraseña",
              obscureText: true,
              controller: _contraseniaController,
            ),

            const SizedBox(height: 25),

            // Botón de registro
            MyButton(
              text: "Register",
              onTap: () => register(context),
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
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black, // Color del borde
                            width: 1.5, // Grosor del "subrayado"
                            style: BorderStyle.solid, // Puedes cambiarlo a dotted si deseas un efecto punteado
                            ),
                          ),
                      ),
                      child: Text(
                        "Inicia sesión ahora",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Color del texto
                        ),
                      ),
                    ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


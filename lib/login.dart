import 'package:app/componentes/button.dart';
import 'package:app/componentes/textField.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores para correo y contraseña
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();

  // Método de login
  void login() {
    // Aquí puedes añadir la lógica para autenticar al usuario.
    print("Correo: ${_correoController.text}");
    print("Contraseña: ${_contraseniaController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
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
                "¡Bienvenido de nuevo, te hemos extrañado!",
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

              const SizedBox(height: 25),

              // Botón de login
              MyButton(
                text: "Login",
                onTap: login,
              ),

              const SizedBox(height: 25),

              // "Regístrate ahora"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿No eres miembro? ",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Regístrate ahora",
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
      ),
    );
  }

  @override
  void dispose() {
    _correoController.dispose();
    _contraseniaController.dispose();
    super.dispose();
  }
}

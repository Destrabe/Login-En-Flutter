import 'package:app/principal/registro.dart';
import 'package:flutter/material.dart';
import 'package:app/principal/login.dart';

class LoginORegister extends StatefulWidget {
  const LoginORegister({super.key});

  @override
  State<LoginORegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginORegister> {
  // Inicialmente, mostrar la página de inicio de sesión
  bool showLoginPage = true;
  // alternar entre la página de inicio de sesión y la de registro
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return Registro(
        onTap: togglePages,
      );
    }
  }
}

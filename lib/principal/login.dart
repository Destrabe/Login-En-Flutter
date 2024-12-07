import 'package:flutter/material.dart';
import 'package:app/componentes/button.dart';
import 'package:app/componentes/textField.dart';
import 'package:app/principal/Homepage.dart';
import 'package:app/services/api_loginin.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LoginPage extends StatefulWidget {
  final Function() onTap;
  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();

  String nombreErrorMessage = '';
  String contraseniaErrorMessage = '';
  bool isLoading = false;
  bool obscureText = true;

  final Api_loginin _apiLoginin = Api_loginin();

  @override
  void initState() {
    super.initState();

    // Listeners para actualizar dinámicamente los campos de texto
    _nombreController.addListener(() {
      setState(() {});
    });
    _contraseniaController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _contraseniaController.dispose();
    super.dispose();
  }

  void _hideErrorMessages() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          nombreErrorMessage = '';
          contraseniaErrorMessage = '';
        });
      }
    });
  }

  void _login() async {
    setState(() {
      nombreErrorMessage = '';
      contraseniaErrorMessage = '';
    });

    // Validar campos vacíos
    if (_nombreController.text.isEmpty) {
      setState(() {
        nombreErrorMessage = "Por favor ingresa un nombre";
      });
    }

    if (_contraseniaController.text.isEmpty) {
      setState(() {
        contraseniaErrorMessage = "Por favor ingresa una contraseña";
      });
    }

    if (_nombreController.text.isEmpty || _contraseniaController.text.isEmpty) {
      _hideErrorMessages(); // Ocultar mensajes tras un tiempo
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      bool isLoggedIn = await _apiLoginin.loginUser(
        _nombreController.text,
        _contraseniaController.text,
      );

      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(onTap: widget.onTap),
          ),
        );
      }
    } catch (e) {
      String error = e.toString();
      print("Error capturado: $error");

      setState(() {
        if (error.contains('Nombre de usuario incorrecto')) {
          nombreErrorMessage = "Nombre no registrado";
        } else if (error.contains('Contraseña incorrecta')) {
          contraseniaErrorMessage = "Contraseña incorrecta";
        } else {
          nombreErrorMessage = "Error desconocido. Por favor intente de nuevo.";
        }
      });
    } finally {
      _hideErrorMessages(); // Ocultar mensajes tras un tiempo
      setState(() {
        isLoading = false;
      });
    }
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
              AutoSizeText(
                "¡Bienvenido de nuevo, te hemos extrañado!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
                maxLines: 1,
                minFontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 25),

              // Campo de texto para nombre
              CustomTextField(
                hintText: "Nombre",
                obscureText: false,
                controller: _nombreController,
                prefixIcon: Icon(Icons.email_outlined),
                suffixIcon: _nombreController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _nombreController.clear();
                          });
                        },
                        child: Icon(Icons.clear, color: Colors.grey),
                      )
                    : null,
                isError: nombreErrorMessage.isNotEmpty,
              ),

              if (nombreErrorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      nombreErrorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),

              const SizedBox(height: 10),

              // Campo de texto para contraseña
              CustomTextField(
                hintText: "Contraseña",
                obscureText: obscureText,
                controller: _contraseniaController,
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: _contraseniaController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                      )
                    : null,
                isError: contraseniaErrorMessage.isNotEmpty,
              ),

              if (contraseniaErrorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      contraseniaErrorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),

              const SizedBox(height: 25),

              // Botón de login
              MyButton(
                text: isLoading ? "Cargando..." : "Iniciar sesión",
                onTap: isLoading ? null : _login,
              ),

              const SizedBox(height: 25),

              // "Regístrate ahora"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿No eres miembro? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Regístrate ahora",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

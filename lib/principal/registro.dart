import 'package:app/componentes/button.dart';
import 'package:app/componentes/textField.dart';
import 'package:app/principal/login.dart';
import 'package:app/services/api_registro.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  final Function() onTap;
  const Registro({Key? key, required this.onTap}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<Registro> {
  // Controladores para los campos de texto
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();

  String nombreErrorMessage = '';
  String correoErrorMessage = '';
  String contraseniaErrorMessage = '';
  bool isLoading = false;
  bool obscureText = true;

  final Api_registro _apiRegistro = Api_registro();

  @override
  void initState() {
    super.initState();
    _nombreController.addListener(() {
      setState(() {});
    });
    _correoController.addListener(() {
      setState(() {});
    });
    _contraseniaController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _correoController.dispose();
    _contraseniaController.dispose();
    super.dispose();
  }

  void _hideErrorMessages() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          nombreErrorMessage = '';
          correoErrorMessage = '';
          contraseniaErrorMessage = '';
        });
      }
    });
  }

  void _registro() async {
    setState(() {
      nombreErrorMessage = '';
      correoErrorMessage = '';
      contraseniaErrorMessage = '';
    });

    if (_nombreController.text.isEmpty) {
      setState(() {
        nombreErrorMessage = "Por favor ingresa un nombre";
      });
    }

    if (_correoController.text.isEmpty) {
      setState(() {
        correoErrorMessage = "Por favor ingresa un correo";
      });
    }

    if (_contraseniaController.text.isEmpty) {
      setState(() {
        contraseniaErrorMessage = "Por favor ingresa una contraseña";
      });
    } else if (_contraseniaController.text.length < 6) {
      setState(() {
        contraseniaErrorMessage =
            "La contraseña debe tener al menos 6 caracteres";
      });
    } else {
      setState(() {
        contraseniaErrorMessage = '';
      });
    }

    if (_nombreController.text.isEmpty ||
        _correoController.text.isEmpty ||
        _contraseniaController.text.isEmpty) {
      _hideErrorMessages();
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      bool isRegistered = await _apiRegistro.registerUser(
        _nombreController.text,
        _correoController.text,
        _contraseniaController.text,
      );

      if (isRegistered) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(onTap: widget.onTap),
          ),
        );
      }
    } catch (e) {
      String error = e.toString();
      print("Error capturado: $error");

      setState(() {
        if (error.contains('El nombre de usuario ya se encuentra en uso')) {
          nombreErrorMessage = "El nombre ya está registrado";
        } else if (error.contains('El correo ya se encuentra en uso')) {
          correoErrorMessage = "El correo ya está registrado";
        } else if (error
            .contains('El correo ingresado no es un correo institucional')) {
          correoErrorMessage =
              "El correo ingresado no es un correo institucional";
        } else {
          nombreErrorMessage = "Error desconocido. Por favor intente de nuevo.";
        }
      });
    } finally {
      _hideErrorMessages();
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
                //logo
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

                // TextField para el nombre
                CustomTextField(
                  hintText: "Nombre",
                  obscureText: false,
                  controller: _nombreController,
                  prefixIcon: Icon(Icons.person),
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
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .primary, // Tema cuando no está enfocado
                    width: 1.5,
                  ),
                  focusedBorderSide: const BorderSide(
                    color: Colors.black, // Borde negro cuando está enfocado
                    width: 2.0,
                  ),
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

                SizedBox(height: 10),

                // TextField para el correo
                CustomTextField(
                  hintText: "Correo electrónico",
                  obscureText: false,
                  controller: _correoController,
                  prefixIcon: Icon(Icons.email_outlined),
                  suffixIcon: _correoController.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _correoController.clear();
                            });
                          },
                          child: Icon(Icons.clear, color: Colors.grey),
                        )
                      : null,
                  isError: correoErrorMessage.isNotEmpty,
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .primary, // Tema cuando no está enfocado
                    width: 1.5,
                  ),
                  focusedBorderSide: const BorderSide(
                    color: Colors.black, // Borde negro cuando está enfocado
                    width: 2.0,
                  ),
                ),
                if (correoErrorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        correoErrorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),

                SizedBox(height: 10),

                // TextField para la contraseña
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
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        )
                      : null,
                  isError: contraseniaErrorMessage.isNotEmpty,
                  borderSide: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .primary, // Tema cuando no está enfocado
                    width: 1.5,
                  ),
                  focusedBorderSide: const BorderSide(
                    color: Colors.black, // Borde negro cuando está enfocado
                    width: 2.0,
                  ),
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

                //Boton de login
                MyButton(
                  text: isLoading ? "Cargando..." : "Iniciar sesión",
                  onTap: isLoading ? null : _registro,
                ),

                const SizedBox(height: 25),

                // "Inicia sesión ahora"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ya eres miembro? ",
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
                          "Inicia sesión",
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
        ));
  }
}

import 'package:app/componentes/button.dart';
import 'package:app/componentes/textField.dart';
import 'package:app/homepage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.onTap});

  //ir a la pagina de registro
  final void Function()? onTap;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores para correo y contraseña
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();
  
  // Variables para los campos de texto
  late final CustomTextField correoLogin = CustomTextField(
    hintText: "Email",
    obscureText: false,
    controller: _correoController,
  );

  late final CustomTextField contraseniaLogin = CustomTextField(
  hintText: "Contraseña",
  obscureText: false,
  controller: _contraseniaController,
  );


  // Método de login
  void login(BuildContext context) {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Homepage()),
  );

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
              Center(
                child: AutoSizeText(
                "¡Bienvenido de nuevo, te hemos extrañado!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
                maxLines: 1, // Limita el texto a una sola línea
                minFontSize: 12, // Define un tamaño mínimo para que no se reduzca demasiado
                overflow: TextOverflow.ellipsis,
              ),
            ),

              const SizedBox(height: 25),

              // Campos de texto
              correoLogin,
              const SizedBox(height: 10),
              contraseniaLogin,
              const SizedBox(height: 25),

              // Botón de login
              MyButton(
                text: "Login",
                onTap: () => login(context),
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
                        "Regístrate ahora",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Color del texto
                        ),
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

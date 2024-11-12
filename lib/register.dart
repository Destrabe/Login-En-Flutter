import 'package:app/componentes/button.dart';
import 'package:app/componentes/textField.dart';
import 'package:app/login.dart';
import 'package:app/services/api_registro.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key, required this.onTap});

  //ir a la pagina de registro
  final void Function()? onTap;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Controladores para correo y contraseña
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contraseniaController = TextEditingController();

  // Variables para los campos de texto
  late final CustomTextField nombreRegister;
  late final CustomTextField correoRegister;
  late final CustomTextField contraseniaRegister;

  @override
  void initState() {
    super.initState();
    // Inicialización de los campos de texto
    nombreRegister = CustomTextField(
      hintText: "Nombre",
      obscureText: false,
      controller: _nombreController,
    );
    correoRegister = CustomTextField(
      hintText: "Email",
      obscureText: false,
      controller: _correoController,
    );
    contraseniaRegister = CustomTextField(
      hintText: "Contraseña",
      obscureText: true,
      controller: _contraseniaController,
    );
  }

  //metodo API
  void register(BuildContext context) async {
  
  // Obtén los datos del formulario
  String nombre = _nombreController.text;
  String contrasenia = _contraseniaController.text;
  String correo = _correoController.text;

  try {
    // Llama al servicio de la API con los datos del formulario
    bool success = await Api_registro().registerUser(nombre, contrasenia, correo);

    if (success) {
      // Si el registro fue exitoso, navega a la página de login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage(onTap: () {})),
      );
    } else {
      // Si el registro falla, muestra un mensaje de error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("No se pudo registrar el usuario. Intenta nuevamente."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  } catch (e) {
    // Si hay un error al conectar con la API, muestra un mensaje
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text("Hubo un problema al conectar con la API. Intenta más tarde."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
       child:SingleChildScrollView(
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
                "Vamos a crear una cuenta para usted",
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
            nombreRegister,
            const SizedBox(height: 10),
            correoRegister,
            const SizedBox(height: 10),
            contraseniaRegister,
            const SizedBox(height: 25),

            // Botón de registro
            MyButton(
              text: "Registrate",
              onTap: () => register(context),
            ),
            const SizedBox(height: 25),

            // "Inicia sesion ahora"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿Ya tienes una cuenta? ",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: widget.onTap, // Usamos widget.onTap
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black, // Color del subrayado
                          width: 1.5, // Grosor del subrayado
                          style: BorderStyle.solid,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextFieldError extends StatefulWidget {
  final String hintText; 
  final bool obscureText;
  final TextEditingController controller; 

  // Constructor
  const CustomTextFieldError({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller, required BorderSide borderSide,
  });

  @override
  _CustomTextFieldStateError createState() => _CustomTextFieldStateError();
}

class _CustomTextFieldStateError extends State<CustomTextFieldError> {
  //indica si hay texto en el campo
  bool hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        hasText = widget.controller.text.isNotEmpty;
      });
    });
  }

  void updateText(String newText) {
    widget.controller.text = newText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      //Margen
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: widget.obscureText,
        controller: widget.controller,
        style: TextStyle(color: Colors .black), // Color del texto
        decoration: InputDecoration(
          labelText: widget.hintText, 
          labelStyle: TextStyle(color: Colors.red), // Color de la etiqueta
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),// Borde del campo cuando no está enfocado
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),// Borde del campo cuando está enfocado
          ),
          fillColor: Theme.of(context).colorScheme.secondary, // Color de fondo del textField
          filled: true, 
          suffixIcon: hasText
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.black), // color del icono
                  onPressed: () {
                    widget.controller.clear(); 
                    setState(() {
                      hasText = false; 
                    });
                  },
                )
              : null, 
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final bool isError;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final BorderSide borderSide; // Borde cuando no está seleccionado
  final BorderSide focusedBorderSide; // Borde cuando está seleccionado

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.isError,
    this.prefixIcon,
    this.suffixIcon,
    required this.borderSide,
    required this.focusedBorderSide,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hasText = false;
  bool showPassword = false;

  // Método que escucha los cambios en el controlador
  void _onTextChanged() {
    if (mounted) {
      setState(() {
        hasText = widget.controller.text.isNotEmpty;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Añadimos el listener
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    // Eliminamos el listener al desmontar el widget
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: widget.obscureText && !showPassword,
        controller: widget.controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          // Borde sin enfoque
          enabledBorder: OutlineInputBorder(
            borderSide: widget.isError
                ? const BorderSide(color: Colors.red, width: 1.5)
                : widget.borderSide,
          ),
          // Borde con enfoque
          focusedBorder: OutlineInputBorder(
            borderSide: widget.isError
                ? const BorderSide(color: Colors.red, width: 2.0)
                : widget.focusedBorderSide,
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon ??
              (hasText
                  ? (widget.obscureText
                      ? IconButton(
                          icon: Icon(
                            showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.clear, color: Colors.black),
                          onPressed: () {
                            widget.controller.clear();
                            setState(() {
                              hasText = false;
                            });
                          },
                        ))
                  : null),
        ),
      ),
    );
  }
}

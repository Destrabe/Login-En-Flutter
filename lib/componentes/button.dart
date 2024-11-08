import 'package:flutter/material.dart';

class MyButton extends StatelessWidget { //no tiene un estado que puede cambiar en tiempo de ejecucion
  final void Function()? onTap;
  
  final String text;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    });

  @override
  Widget build(BuildContext context) { //construye la interfaz del widget
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(25),//Agrega un espacio interno
        margin: const EdgeInsets.symmetric(horizontal: 25), //margen del boton
        child: Center(
         child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
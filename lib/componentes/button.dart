import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent, // Sin sombra
      splashColor: Colors.transparent, // Sin efecto de salpicadura (efecto de onda)
      onTap: onTap, // Asigna la acción aquí, que se ejecutará al presionar el botón
      borderRadius: BorderRadius.circular(15), // Para mantener los bordes redondeados
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}

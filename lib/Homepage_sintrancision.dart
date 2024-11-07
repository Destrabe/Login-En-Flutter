/*import 'package:app/pages/perfil.dart';
import 'package:app/pages/planes.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:app/pages/grupos.dart';
import 'package:app/pages/home.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  int _selectedIndex = 0;

  // Lista de pantallas para cada pestaña
  final List<Widget> _pages = [
    homeTab(),
    planesTab(),
    gruposTab(),
    perfilTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_selectedIndex], // Contenido según la pestaña seleccionada
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8), //Tamaño del contenedor de los tabs
          child: GNav(
            backgroundColor: Colors.black,//rectangulo donde estan los botones
            color: Colors.white,//color de los botones antes de ser presionados
            activeColor: Colors.white,//color de los botones despues de ser presionados
            tabBackgroundColor: Colors.grey.shade800, //color del area del boton seleccionado
            gap: 8,
            padding: const EdgeInsets.all(10), //Tamaño del relleno alrededor de los tabs
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.padding ,
                text: 'Planes',
              ),
              GButton(
                icon: Icons.groups,
                text: 'Grupos',
              ),
              GButton(
                icon: Icons.person,
                text: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );



  }
}*/

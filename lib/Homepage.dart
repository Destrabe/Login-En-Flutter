import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/planes.dart';
import 'package:app/pages/grupos.dart';
import 'package:app/pages/perfil.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.onTap});
  final VoidCallback onTap;


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

  // Lista de pantallas para cada pestaña
  final List<Widget> _pages = [
    homeTab(),
    planesTab(),
    gruposTab(),
    perfilTab(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Contenido según la pestaña seleccionada con transición
        child: TabBarView(
          controller: _tabController,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,//color del recuadro de atras 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8), // Tamaño del contenedor de los tabs
          child: GNav(
            backgroundColor: Colors.black, // Rectángulo donde están los botones
            color: Colors.white, // Color de los botones antes de ser presionados
            activeColor: Colors.white, // Color de los botones después de ser presionados
            tabBackgroundColor: Colors.grey.shade800, // Color del área del botón seleccionado
            gap: 8,
            padding: const EdgeInsets.all(10), // Tamaño del relleno alrededor de los tabs
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                _tabController.index = index; // Actualizar el TabController
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.padding,
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
}


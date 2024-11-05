import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: GNav(
            //rectangulo donde estan los botones
            backgroundColor: Colors.black,
            //color de los botones antes de ser presionados
            color: Colors.white,
            //color de los botones despues de ser presionados
            activeColor: Colors.white,
            //color del area del boton seleccionado
            tabBackgroundColor: Colors.grey.shade800,
            gap:10,
            
            onTabChange: (index){
              print(index);
            },

            padding:EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
                ),
        
              GButton(
                icon: Icons.notifications,
                text: 'Notificaciones',
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

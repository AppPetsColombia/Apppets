import 'package:adopt_me/autentication.dart';
import 'package:adopt_me/login.dart';
import 'package:adopt_me/missing.dart';
import 'package:adopt_me/pqrs.dart';
import 'package:flutter/material.dart';

class Hamburguer extends StatefulWidget {
  const Hamburguer({super.key});

  @override
  State<Hamburguer> createState() => _HamburguerState();
}

class _HamburguerState extends State<Hamburguer> {
  Future<void> singOut() async {
    Authentication().singOut();
  }
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Inicio'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Mascotas perdidas'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) => Missing()));
              },
            ),
            ListTile(
              title: const Text('Chats'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Solicitudes'),
              selected: _selectedIndex == 3,
              onTap: () {
                // Update the state of the app
                _onItemTapped(3);
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder:(context)=> Pqrs()));
              },
            ),
            ListTile(
              title: const Text('Cerrar sesion'),
              selected: _selectedIndex == 4,
              onTap: () {
                // Update the state of the app
                _onItemTapped(4);
                // Then close the drawer
                singOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ]
      ),
    );
  }
}

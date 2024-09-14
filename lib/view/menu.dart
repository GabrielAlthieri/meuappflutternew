import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 53, 155, 250),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Cursos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/cursos');
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Feriados'),
            onTap: () {
              Navigator.of(context).pop(); 
              Navigator.of(context).pushReplacementNamed('/feriados');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
      
            },
          ),
        ],
      ),
    );
  }
}

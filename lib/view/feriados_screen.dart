import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; 

class FeriadosScreen extends StatefulWidget {
  const FeriadosScreen({super.key});

  @override
  _FeriadosScreenState createState() => _FeriadosScreenState();
}

class _FeriadosScreenState extends State<FeriadosScreen> {
  Future<List<dynamic>>? _feriados;

  @override
  void initState() {
    super.initState();
    _feriados = fetchFeriados();
  }

  Future<List<dynamic>> fetchFeriados() async {
    final response = await http.get(Uri.parse('https://brasilapi.com.br/api/feriados/v1/2024'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data;
    } else {
      throw Exception('Erro ao carregar os feriados.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feriados Nacionais'),
        backgroundColor: Colors.blue.shade400,
        elevation: 0.0,
      ),
      drawer: const CustomDrawer(), 
      body: FutureBuilder<List<dynamic>>(
        future: _feriados,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar feriados.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum feriado disponível.'));
          }

          final feriados = snapshot.data!;

          return ListView.builder(
            itemCount: feriados.length,
            itemBuilder: (context, index) {
              final feriado = feriados[index];
              final formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(feriado['date']));

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),  
                child: Card(
                  elevation: 1.0,  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), 
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12.0),  
                    leading: Container(
                      padding: const EdgeInsets.all(6.0),  
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(Icons.holiday_village_rounded, color: Colors.blue.shade700),
                    ),
                    title: Text(
                      feriado['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0, 
                      ),
                    ),
                    subtitle: Text(
                      formattedDate,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),  
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF42A5F5),
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
            leading: const Icon(Icons.school),
            title: const Text('Cursos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/cursos');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Feriados'),
            onTap: () {
              Navigator.of(context).pop(); 
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
             
            },
          ),
        ],
      ),
    );
  }
}

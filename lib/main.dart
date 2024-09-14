import 'package:flutter/material.dart';
import 'package:meuapp/view/home_screen.dart';
import 'package:meuapp/view/login_screen.dart';
import 'package:meuapp/view/feriados_screen.dart'; 
import 'package:meuapp/view/home_screen.dart'; 
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
              foregroundColor: MaterialStatePropertyAll(Colors.white)),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
          background: Colors.grey[100],
        ),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/cursos': (context) =>  HomeScreen(),
        '/feriados': (context) => const FeriadosScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:menu_navigator/pages/main/MenuHome.dart';
import 'package:menu_navigator/pages/main/MenuTraining.dart';
import 'package:menu_navigator/pages/main/MenuNutrition.dart';
import 'package:menu_navigator/pages/main/MenuProfile.dart';
import 'router.dart' as router;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //1. Indice del selector del menu
  int _selectedIndex = 0;
  //2. Lista de opciones del menu
  static final List<Widget> _widgetOptions = <Widget>[
    const MenuHome(),
    const MenuTraining(),
    const MenuNutrition(),
    const MenuProfile()
  ];
  //3. Funcion que guarda el valor del indice seleccionado
  void _selOptInMenu(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      //4. Elemento que se muestra actualmente en la pantalla principal
      body: Center(child: _widgetOptions.elementAt(_selectedIndex),),
      //5. Implementacion de la navegacion en el menu
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Entrenamientos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant), label: 'Dieta'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Ajustes')
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber,
        onTap: _selOptInMenu,
      ),
    );
    
  }
}

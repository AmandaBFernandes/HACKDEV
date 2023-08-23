import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'carrinho.dart';
import 'Categoria1.dart';

//  Inicialização

void main() {
  runApp(const MyApp());
}

// StatelessWidget
class MyApp extends StatelessWidget {
  // Construtor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const HomeScreen(),
    );
  }
}

// StatefulWidget
class HomeScreen extends StatefulWidget {
  // Construtor
  const HomeScreen({super.key});

  @override
  StateHomeScreen createState() => StateHomeScreen();
}

// State
class StateHomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static List<Widget> _WidgetOptions = <Widget>[
    Categoria1(),
    Pagina(),
    Text(
      'Carrinho',
      style: optionStyle,
    ),
    Text(
      'Conta',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        title: Text('AppBar'),
        backgroundColor: Colors.grey,
        leading:
          IconButton(
            onPressed: (){}, 
            icon: Icon(CupertinoIcons.cart, size: 28,)),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(CupertinoIcons.search, size: 28,)),
        ],
        ),
      body: Center(child: _WidgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child:  SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.grey,
                    hoverColor: Colors.grey,
                    gap: 8,
                    activeColor: Colors.white,
                    tabBackgroundColor: Color(0xFFF06625),
                    duration: Duration(milliseconds: 400),
                    color: Colors.black,
                    tabs: [
                      GButton(icon: LineIcons.home, text: "Home"),
                      GButton(icon: LineIcons.heart, text: "Favoritos"),
                      GButton(icon: LineIcons.shoppingBag, text: "Carrinho"),
                      GButton(icon: LineIcons.user, text: "Conta"),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  )))),
    );
  }
}

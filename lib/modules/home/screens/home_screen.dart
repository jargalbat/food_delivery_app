import 'package:flutter/material.dart';
import 'package:food_delivery_app/modules/product/screens/products_screen.dart';
import 'package:food_delivery_app/modules/profile/profile_screen.dart';
import 'package:food_delivery_app/modules/search/screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProductsScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хоол хүргэлтийн апп'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Нүүр',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Хайх',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Тохиргоо',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:techpack_demo/apps/apps.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({
    super.key,
  });

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    const MyHome(title: '10,000 DEMO'),
    const Center(
      child: Text('Search Screen'),
    ),
    const Center(
      child: Text('Cart Screen'),
    ),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (value) => setCurrentScreen(value),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }

  void setCurrentScreen(int value) {
    return setState(() {
      _selectedIndex = value;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final List<Map<String, dynamic>> _navbar = [
    {'icon': Icon(Icons.home), 'page': HomePage()},
    {'icon': Icon(Icons.search), 'page': SearchPage()},
    {'icon': Icon(Icons.motorcycle), 'page': MotorcyclePage()},
  ];

  int _currentIndex = 0; // Default index for Home

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navbar[_currentIndex]['page'], // Display the current page
      bottomNavigationBar: CurvedNavigationBar(
        items: _navbar.map((item) => item['icon'] as Widget).toList(),
        index: _currentIndex, // Set the initial index
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home Page')),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Search Page')),
    );
  }
}

class MotorcyclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Motorcycle Page')),
    );
  }
}

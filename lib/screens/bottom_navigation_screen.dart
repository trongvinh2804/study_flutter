import 'package:flutter/material.dart';
import 'package:hello/screens/screen_navigation/home.dart';
import 'package:hello/screens/screen_navigation/profile_screen.dart';
import 'package:hello/screens/screen_navigation/search_creen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key, required this.title});

  final String title;

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreen();
}

class _BottomNavigationScreen extends State<BottomNavigationScreen> {
  var _selectedIndex = 0;
  final List<Widget> _screens = [
    const Home(title: 'Home'),
    const SearchCreen(title: 'Search'),
    const ProfileScreen(title: 'Profile'),
  ];

  void onPress(selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => onPress(value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

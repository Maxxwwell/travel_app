import 'package:flutter/material.dart';

import 'screens/flight_screen.dart';
import 'screens/hotel_screen.dart';
import 'screens/places.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNav createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> _children = [Flight(), Hotel(), Places()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Theme.of(context).accentColor,

        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          iconSize: 30,
          selectedFontSize: 16,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black54,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.flight_takeoff_rounded), label: 'Travel'),
            BottomNavigationBarItem(
                icon: Icon(Icons.hotel_rounded), label: 'Hotels'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_pin), label: 'Places'),
          ],
        )
        // bottomNavigationBar: ,
        );
  }
}

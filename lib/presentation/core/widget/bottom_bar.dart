import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedIconTheme: IconThemeData(
        color: Color.fromRGBO(207, 210, 224, 1),
      ),
      selectedIconTheme: IconThemeData(
        //color: Constants.primaryColor,
        color: Theme.of(context).primaryColor
      ),
      selectedLabelStyle: TextStyle(
        decoration: TextDecoration.none,
        decorationColor: Colors.red,
        color: Colors.red,

      ),
      unselectedLabelStyle: TextStyle(
        color: Color.fromRGBO(207, 210, 224, 1),
      ),
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          label: "Prikaz",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Nastavitve",
          icon: Icon(Icons.settings),
        ),

      ],
    );
  }
}
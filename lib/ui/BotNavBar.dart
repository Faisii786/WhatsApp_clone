import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndexstate = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

        //showUnselectedLabels: false,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black, // Set the selected label color
        //unselectedItemColor: Colors.black, // Set the unselected label color
        currentIndex: currentIndexstate,
        onTap: (value) {
          setState(() {
            currentIndexstate = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Chats',
            icon: Icon(
              Icons.chat,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Updates',
            icon: Icon(
              Icons.update_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Communities',
            icon: Icon(
              Icons.people_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Calls',
            icon: Icon(
              Icons.call,
            ),
          ),
        ]);
  }
}

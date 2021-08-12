import 'package:flutter/material.dart';

class BottomMenuBar extends StatefulWidget {
  BottomMenuBarState createState() => BottomMenuBarState();
  Function onIndexChangeCallback;
  int currentIndex;

  BottomMenuBar(this.onIndexChangeCallback, this.currentIndex);
}

class BottomMenuBarState extends State<BottomMenuBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.local_offer),
          label: 'Offers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        )
      ],
      onTap: (value) {
        setState(() {
          this.widget.currentIndex = value;
          this.widget.onIndexChangeCallback(value);
        });
      },
    );
  }
}

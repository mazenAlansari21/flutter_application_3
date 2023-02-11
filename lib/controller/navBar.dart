

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: GNav(backgroundColor: Colors.grey, tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
          backgroundColor: Colors.white,
        ),
        GButton(
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
          icon: Icons.search,
          text: 'Search',
          backgroundColor: Colors.white,
        ),
        GButton(
          onPressed: () {},
          icon: Icons.task,
          iconColor: Colors.black,
          text: 'Task',
          textColor: Colors.purple,
          backgroundColor: Colors.white,
        ),
      ]),
    );
  }
}
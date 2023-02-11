import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class MyAnimals extends StatefulWidget {
  const MyAnimals({super.key});

  @override
  State<MyAnimals> createState() => _MyAnimalsState();
}

class _MyAnimalsState extends State<MyAnimals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My animals",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.grey,
         elevation: 30,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: InkWell(
              // splashColor: Colors.black,

              onTap: () {
                Navigator.pushNamed(context, 'Animal');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "img/Dog2.jpg",
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GNav(
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
         GButton(
            icon: Icons.home,
            text: "home",
            iconColor: Colors.black,
            iconSize: 30,
            onPressed: (){
              Navigator.pushNamed(context, 'homePage');
            },
          ),
          GButton(
              icon: Icons.task,
              text: "task",
              iconColor: Colors.black,
              iconSize: 30),
          GButton(
              icon: Icons.search,
              text: "search",
              iconColor: Colors.black,
              iconSize: 30,
              onPressed: () {
              Navigator.pushNamed(context, 'search');
              }
              ),
        ],
        backgroundColor: Colors.grey,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class searchPlant extends StatefulWidget {
  const searchPlant({super.key});

  @override
  State<searchPlant> createState() => _searchPlantState();
}

class _searchPlantState extends State<searchPlant> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search Plant"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      bottomNavigationBar: GNav(
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          GButton(
            icon: Icons.home,
            text: "home",
            iconColor: Colors.black,
            iconSize: 30,
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
              }),
        ],
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
            child: Container(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "search for plant ",
                  hintStyle: TextStyle(fontSize: 20),
                  labelText: "plant",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              
              ),
            ),
          ),
        ],
      ),
    );
  }
}






import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:convert';


class chooseAnimal extends StatefulWidget {
  final Rank;
  final ScientificName;
  const chooseAnimal({this.Rank,this.ScientificName});

  @override
  State<chooseAnimal> createState() => _chooseAnimalState();
}

class _chooseAnimalState extends State<chooseAnimal> {
   List display = [];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("about animal"),
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
              onPressed: () {
                Navigator.pushNamed(context, "homePage");
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
                }),
            GButton(
                icon: Icons.person,
                text: "animal",
                iconColor: Colors.black,
                iconSize: 30,
                onPressed: () {
                  Navigator.pushNamed(context, 'MyAnimals');
                }),
          ],
          backgroundColor: Colors.grey,
        ),
        body: Column(children: [
        
        ]),
        );
  }
}




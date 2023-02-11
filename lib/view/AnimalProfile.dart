// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers;

import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  var Gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Create profile",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        centerTitle: true,
        elevation: 30,
      ),
      // ignore: prefer_const_literals_to_create_immutables
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Image.asset(
                "img/Dog2.jpg",
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 20, 0),
              child: Container(
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "add your animal name",
                    hintStyle: TextStyle(
                      fontSize: 20,
                    ),
                    labelText: "Name",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 20, 0),
              child: Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "add your animal age",
                    hintStyle: TextStyle(fontSize: 20),
                    labelText: "Age",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 20, 0),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text("choose the gender",
                      style: TextStyle(fontSize: 25, color: Colors.black)),
                  Row(
                    children: [
                      Text("male", style: TextStyle(fontSize: 20)),
                      Row(
                        children: [
                          Radio(
                              value: "male",
                              groupValue: Gender,
                              onChanged: (val) {
                                setState(() {
                                  Gender = val;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("female", style: TextStyle(fontSize: 20)),
                      Radio(
                          value: "female",
                          groupValue: Gender,
                          onChanged: (val) {
                            setState(() {
                              Gender = val;
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
            Text("add picture", style: TextStyle(fontSize: 20)),
            IconButton(
              onPressed: () {
                
              },
              iconSize: 25,
              color: Colors.black,
              icon: Icon(Icons.camera_alt_sharp),
            ),
          ],
        ),
      ),
    );
  }
}

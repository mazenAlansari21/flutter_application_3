import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search"),
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
            onPressed: (){
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
              iconSize: 30),
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Material(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'searchPlant');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "img/p1.jpg",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "search for plant",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Material(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'searchAnimal');
                  
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "img/a1.jpeg",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "search for animal",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



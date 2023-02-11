import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Animal extends StatefulWidget {
  const Animal({super.key});

  @override
  State<Animal> createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animal",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 30,
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
                  Navigator.pushNamed(context, 'createAnimalProfile');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "img/Dog2.jpg",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "create Animal Profile",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.add, size: 35),
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
              }),
        ],
        backgroundColor: Colors.grey,
      ),
    );
  }
}
